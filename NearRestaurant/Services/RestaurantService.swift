//
//  RestaurantService.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

enum NearRestaurantEndpoint {
    static let domain: String = "https://nearrestaurant.glitch.me"
    static let categoriesEndpoint: String = domain + "/categories"
    static let restaurantsEndpoint: String = domain + "/restaurants"
    static let getAllTrending: String = domain + "/restaurants?isTrending=true"
    static let getTop5Restaurant: String = domain + "/restaurants?numOfTop=5"
    
    static let getImagesByRestaurant: (String, String) -> String = { categoryId, restaurantId in
        NearRestaurantEndpoint.domain + "/categories/\(categoryId)/restaurants/\(restaurantId)/images"
    }
}

struct RestaurantService {
    typealias RestaurantImage = String
    
    let categoryService = UtilityService<Category>()
    let restaurantService = UtilityService<Restaurant>()
    let imageService = UtilityService<RestaurantImage>()
    
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
    
    func fetchRestaurantImages(categoryId: String, restaurantId: String, completion: @escaping (Result<[String], CategoryError>) -> Void ){
        let url = NearRestaurantEndpoint.getImagesByRestaurant(categoryId, restaurantId)
       return imageService.fetchData(apiEndpoint: url, completion: completion)
    }
}
