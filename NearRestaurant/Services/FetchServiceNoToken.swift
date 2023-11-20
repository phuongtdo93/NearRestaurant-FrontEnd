//
//  UtilityServiceNoToken.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import Foundation


struct FetchServiceNoToken<T: Codable>: FetchNetworkingProtocol {
    
    typealias T = T
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], ServiceError>) -> Void) {
        guard let url = URL(string: apiEndpoint) else {
            return completion(.failure(.invalidUrl))
        }
        self.urlSession.dataTask(with: url) { data, res, error in
            guard let data, error == nil else {
                return completion(.failure(ServiceError.notAvailableData))
            }
            
            do {
                let decodedData = try JSONDecoder().decode([T].self, from: data)
                return completion(.success(decodedData))
            } catch {
                return completion(.failure(ServiceError.invalidDataStructure))
            }
        }.resume()
    }
    
}


struct PushServiceNoToken<T: Codable, U: Decodable>: PushNetworkingProtocol {
    typealias U = U

    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func pushData(apiEndpoint: String,  input: T, completion: @escaping(Result<U?, ServiceError>) -> Void) {
        guard let url = URL(string: apiEndpoint) else {
            return completion(.failure(.invalidUrl))
        }
        var urlRequest = URLRequest(url: url)

        urlRequest.httpBody = try? JSONEncoder().encode(input)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        self.urlSession.dataTask(with: urlRequest) { data, response, err in
            guard let data, err == nil else {
                return completion(.failure(.notAvailableData))
            }

            do {
                let decodedData = try JSONDecoder().decode(U.self, from: data)
                return completion(.success(decodedData))
            } catch {
                return completion(.failure(.invalidDataStructure))
            }
        }.resume()
    }
}
