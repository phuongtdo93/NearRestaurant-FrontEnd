//
//  FetchNetworkingProtocol.swift
//  NearRestaurant
//
//  Created by Salmdo on 11/19/23.
//

import Foundation

protocol FetchNetworkingProtocol {
    associatedtype T
    
    func fetchData(apiEndpoint: String, completion: @escaping (Result<[T], ServiceError>) -> Void)
}
