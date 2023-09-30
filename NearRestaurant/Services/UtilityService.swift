//
//  RestaurantService.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation


enum CategoryError: Error {
    case invalidUrl
    case invalidDataStructure
    case notAvailableData
}

struct UtilityService<T:Decodable> {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], CategoryError>) -> Void)  {
        guard let url = URL(string: apiEndpoint) else {
            //Write unit test for this case
            return completion(.failure(.invalidUrl))
        }
        self.urlSession.dataTask(with: url) { data, res, error in
            guard let data, error == nil else {
                //Write unit test for this case
                return completion(.failure(CategoryError.invalidDataStructure))
            }
            
            do {
                let decodedData = try JSONDecoder().decode([T].self, from: data)
                return completion(.success(decodedData))
            } catch {
                //Write unit test for this case
                return completion(.failure(CategoryError.invalidDataStructure))
            }
        }.resume()
    }
    
    func setFavouriteRestaurant(apiEndpoint: String, categoryId: String, restaurantId: String, isFavourite: Bool, completion: @escaping (Result<Bool, CategoryError>) -> Void) {
        
        let urlString = "\(apiEndpoint)/\(categoryId)/restaurants/\(restaurantId)?isFavourite=\(isFavourite)"
        guard let url = URL(string: urlString) else {
            return completion(.failure(.invalidUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PATCH"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
