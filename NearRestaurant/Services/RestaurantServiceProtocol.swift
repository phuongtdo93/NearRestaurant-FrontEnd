//
//  RestaurantServiceProtocol.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/9/23.
//

import Foundation


protocol RestaurantServiceProtocol {
    func fetchCategory(completion: @escaping (Result<[Category], ServiceError>) -> Void)
    
    func fetchRestaurant(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void)
    
    func fetchAllTrending(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void)
    
    func fetchTop5Restaurant(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void)
    
    func setFavouriteRestaurant( categoryId: String, restaurantId: String,isFavourite:  Bool, completion: @escaping(Result<Bool, ServiceError>) -> Void)
    
    func fetchRestaurantImages(categoryId: String, restaurantId: String, completion: @escaping (Result<[String], ServiceError>) -> Void )
    
    func fetchRestaurantByCategoryId(categoryId: String, completion: @escaping (Result<[Restaurant], ServiceError>) -> Void )
    
}
