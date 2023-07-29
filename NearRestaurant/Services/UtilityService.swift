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
}

struct UtilityService<T:Decodable> {
    private var urlSession: URLSession
    
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
}
