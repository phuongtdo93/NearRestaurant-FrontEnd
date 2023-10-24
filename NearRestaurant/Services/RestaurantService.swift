//
//  RestaurantService.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

struct RestaurantService: RestaurantServiceProtocol {
    
    typealias RestaurantImage = String
    
    let categoryService = UtilityService<Category>()
    let restaurantService = UtilityService<Restaurant>()
    let imageService = UtilityService<RestaurantImage>()
    
    static let instance = RestaurantService()

    
    private init(){
        print("Init single RestaurantService")
    }
    
    func fetchCategory(completion: @escaping (Result<[Category], ServiceError>) -> Void){
        categoryService.fetchData(apiEndpoint: NearRestaurantEndpoint.categoriesEndpoint, completion: completion)
    }
    
    func fetchRestaurant(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.restaurantsEndpoint, completion: completion)
    }
    func fetchAllTrending(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.getAllTrending, completion: completion)
    }
    func fetchTop5Restaurant(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void){
        restaurantService.fetchData(apiEndpoint: NearRestaurantEndpoint.getTop5Restaurant, completion: completion)
    }
    func setFavouriteRestaurant( categoryId: String, restaurantId: String,isFavourite:  Bool, completion: @escaping(Result<Bool, ServiceError>) -> Void) {
        restaurantService.patchDataNoInput(apiEndpoint: NearRestaurantEndpoint.setRestaurantFavourite(categoryId, restaurantId, isFavourite), completion: completion)
    }
    
    func fetchRestaurantImages(categoryId: String, restaurantId: String, completion: @escaping (Result<[String], ServiceError>) -> Void ){
        let url = NearRestaurantEndpoint.getImagesByRestaurant(categoryId, restaurantId)
       return imageService.fetchData(apiEndpoint: url, completion: completion)
    }
    
    func fetchRestaurantByCategoryId(categoryId: String, completion: @escaping (Result<[Restaurant], ServiceError>) -> Void) {
        let url = NearRestaurantEndpoint.fetchRestaurantByCategoryId(categoryId)
        return restaurantService.fetchData(apiEndpoint: url, completion: completion)
    }
}
