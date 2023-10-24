//
//  MockReservationService.swift
//  NearRestaurantTests
//
//  Created by Salmdo on 10/23/23.
//

import Foundation
@testable import NearRestaurant

struct MockUtilityServiceSuccess<T: Codable>: UtilityProtocol {
    var extectedResult: Result<[T], NearRestaurant.ServiceError>?
    var extectedError: Result<[T], NearRestaurant.ServiceError>?
    
    let item: T
    init (item: T){
        self.item = item
    }
    
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], NearRestaurant.ServiceError>) -> Void) {
        return completion(.success([item]))
    }
    
    func pushData(apiEndpoint: String, input: T, completion: @escaping (Result<T?, NearRestaurant.ServiceError>) -> Void) {
        return completion(.success(item))
    }
    
    func patchDataNoInput(apiEndpoint: String, completion: @escaping (Result<Bool, NearRestaurant.ServiceError>) -> Void) {
        return completion(.success(true))
    }
}


struct MockUtilityServiceFailure<T: Codable>: UtilityProtocol {
    let item: T
    init (item: T){
        self.item = item
    }
    
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], NearRestaurant.ServiceError>) -> Void) {
        return completion(.failure(.invalidUrl))
    }
    
    func pushData(apiEndpoint: String, input: T, completion: @escaping (Result<T?, NearRestaurant.ServiceError>) -> Void) {
        return completion(.failure(.invalidUrl))
    }
    
    func patchDataNoInput(apiEndpoint: String, completion: @escaping (Result<Bool, NearRestaurant.ServiceError>) -> Void) {
        return completion(.failure(.invalidUrl))
    }
}
