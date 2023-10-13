//
//  RestaurantServiceProtocol.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/9/23.
//

import Foundation


protocol RestaurantServiceProtocol {
    func fetchCategory(completion: @escaping (Result<[Category], CategoryError>) -> Void)
    
    func fetchRestaurant(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void)
    
    func fetchAllTrending(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void)
    
    func fetchTop5Restaurant(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void)
    
    func setFavouriteRestaurant( categoryId: String, restaurantId: String,isFavourite:  Bool, completion: @escaping(Result<Bool, CategoryError>) -> Void)
    
    func fetchRestaurantImages(categoryId: String, restaurantId: String, completion: @escaping (Result<[String], CategoryError>) -> Void )
    
    func fetchRestaurantByCategoryId(categoryId: String, completion: @escaping (Result<[Restaurant], CategoryError>) -> Void )
    
}
