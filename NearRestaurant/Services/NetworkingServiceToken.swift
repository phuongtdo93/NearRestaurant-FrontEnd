//
//  Created by Salmdo on 7/1/23.
//

import Foundation


struct NetworkingServiceToken<T:Codable>: FetchNetworkingProtocol, PushNetworkingProtocol {
    typealias T = T
    
    private let urlSession: URLSession
    private let token: String
    
    init(urlSession: URLSession = .shared, token: String) {
        self.urlSession = urlSession
        self.token = token
    }
    
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], ServiceError>) -> Void)  {
        guard let url = URL(string: apiEndpoint) else {
            return completion(.failure(.invalidUrl))
        }
        
        var urlRequset = URLRequest(url: url)
        urlRequset.addValue(token, forHTTPHeaderField: "authorization")
        
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

    func pushData(apiEndpoint: String,  input: T, completion: @escaping(Result<T?, ServiceError>) -> Void) {
        guard let url = URL(string: apiEndpoint) else {
            return completion(.failure(.invalidUrl))
        }
        var urlRequest = URLRequest(url: url)

        urlRequest.httpBody = try? JSONEncoder().encode(input)
        urlRequest.httpMethod = "PUSH"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(token, forHTTPHeaderField: "authorization")

        self.urlSession.dataTask(with: urlRequest) { data, response, err in
            guard let data, err == nil else {
                return completion(.failure(.notAvailableData))
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return completion(.success(decodedData))
            } catch {
                return completion(.failure(.invalidDataStructure))
            }
        }.resume()
    }
    
    func patchDataNoInput(apiEndpoint: String, completion: @escaping (Result<Bool, ServiceError>) -> Void) {
        
        guard let url = URL(string: apiEndpoint) else {
            return completion(.failure(.invalidUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PATCH"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(token, forHTTPHeaderField: "authorization")
        
        self.urlSession.dataTask(with: urlRequest) { data, response, err in
            guard let data, err == nil else {
                return completion(.failure(.notAvailableData))
            }
            do {
                let decodedData = try JSONDecoder().decode(RequestResponse.self, from: data)
                return completion(.success(decodedData.success ?? false))
            } catch {
                return completion(.failure(.invalidDataStructure))
            }
        }.resume()
    }
    
}
