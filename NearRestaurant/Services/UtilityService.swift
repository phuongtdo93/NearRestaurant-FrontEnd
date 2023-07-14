//
//  RestaurantService.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation


struct CategoryError: Error {
    var message: String
}

struct UtilityService<T:Decodable> {
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], CategoryError>) -> Void)  {
        guard let url = URL(string: apiEndpoint) else {
            return completion(.failure(CategoryError(message: "URL is incorrect")))
        }
        URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data, error == nil else {
                return completion(.failure(CategoryError(message: "Could not get data")))
            }
            
            do {
                let decodedData = try JSONDecoder().decode([T].self, from: data)
                return completion(.success(decodedData))
            } catch {
                return completion(.failure(CategoryError(message: "Could not decode data")))
            }
        }.resume()
    }
}
