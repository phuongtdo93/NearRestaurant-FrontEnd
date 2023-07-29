//
//  RestaurantService.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

enum NearRestaurantEndpoint {
    static var domain: String = "https://nearrestaurant.glitch.me"
    static var getAllCategories: String = domain + "/categories"
    static var getAllRestaurants: String = domain + "/restaurants"
    static var getAllTrending: String = domain + "/restaurants?isTrending=true"
    static var getTop5Restaurant: String = domain + "/restaurants?numOfTop=5"
}


class RestaurantService {
    var categoryService = UtilityService<Category>()
    var restaurantService = UtilityService<Restaurant>()
    static let instance = RestaurantService()
    
    private init(){
        print("Init single RestaurantService")
    }
    
    func fetchCategory(completion: @escaping (Result<[Category], CategoryError>) -> Void){
        categoryService.fetchData(apiEndpoint: NearRestaurantEndpoint.getAllCategories, completion: completion)
    }
    
    func fetchRestaurant(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.getAllRestaurants, completion: completion)
    }
    func fetchAllTrending(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.getAllTrending, completion: completion)
    }
    func fetchTop5Restaurant(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.getTop5Restaurant, completion: completion)
    }
}
