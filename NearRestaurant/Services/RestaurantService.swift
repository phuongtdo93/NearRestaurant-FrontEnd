//
//  RestaurantService.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

enum NearRestaurantEndpoint {
    static var domain: String = "https://nearrestaurant.glitch.me"
    static var categoriesEndpoint: String = domain + "/categories"
    static var restaurantsEndpoint: String = domain + "/restaurants"
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
        categoryService.fetchData(apiEndpoint: NearRestaurantEndpoint.categoriesEndpoint, completion: completion)
    }
    
    func fetchRestaurant(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.restaurantsEndpoint, completion: completion)
    }
    func fetchAllTrending(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.getAllTrending, completion: completion)
    }
    func fetchTop5Restaurant(completion: @escaping (Result<[Restaurant], CategoryError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.getTop5Restaurant, completion: completion)
    }
    func setFavouriteRestaurant( categoryId: String, restaurantId: String,isFavourite:  Bool, completion: @escaping(Result<Bool, CategoryError>) -> Void) {
        restaurantService.setFavouriteRestaurant(apiEndpoint: NearRestaurantEndpoint.categoriesEndpoint, categoryId: categoryId, restaurantId: restaurantId, isFavourite: isFavourite, completion: completion)
    }
}
