//
//  UtilityProtocol.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/26/23.
//

import Foundation

enum ServiceError: Error {
    case invalidUrl
    case invalidDataStructure
    case notAvailableData
}

protocol UtilityProtocol {
    associatedtype T
    
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], ServiceError>) -> Void)
    func pushData(apiEndpoint: String, input: T, completion: @escaping(Result<T?, ServiceError>) -> Void)
    
    func patchDataNoInput(apiEndpoint: String, completion: @escaping (Result<Bool, ServiceError>) -> Void)
}


protocol PushNetworkingProtocol {
    associatedtype T
    associatedtype U
    
    func pushData(apiEndpoint: String, input: T, completion: @escaping(Result<U?, ServiceError>) -> Void)
}
