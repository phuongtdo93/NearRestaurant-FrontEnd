//
//  RestaurantService.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

struct RestaurantService: RestaurantServiceProtocol {
    
    typealias RestaurantImage = String
    
    let categoryService: FetchServiceNoToken<Category>
    let restaurantService: NetworkingServiceToken<Restaurant>
    let restaurantNoTokenService: FetchServiceNoToken<Restaurant>
    let imageService: FetchServiceNoToken<RestaurantImage>
    
    static let instance = RestaurantService()

    
    private init(){
        let token: String = ""
        categoryService = FetchServiceNoToken<Category>()
        restaurantService = NetworkingServiceToken<Restaurant>(token: token)
        imageService = FetchServiceNoToken<RestaurantImage>()
        restaurantNoTokenService = FetchServiceNoToken<Restaurant>()
    }
    
    func fetchCategory(completion: @escaping (Result<[Category], ServiceError>) -> Void){
        categoryService.fetchData(apiEndpoint: APIEndpoint.categoriesEndpoint, completion: completion)
    }
    
    func fetchRestaurant(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void){
        restaurantNoTokenService.fetchData(apiEndpoint: APIEndpoint.restaurantsEndpoint, completion: completion)
    }
    func fetchAllTrending(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void){
        restaurantNoTokenService.fetchData(apiEndpoint: APIEndpoint.getAllTrending, completion: completion)
    }
    func fetchTop5Restaurant(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void){
        restaurantNoTokenService.fetchData(apiEndpoint: APIEndpoint.getTop5Restaurant, completion: completion)
    }
    func setFavouriteRestaurant( categoryId: String, restaurantId: String,isFavourite:  Bool, completion: @escaping(Result<Bool, ServiceError>) -> Void) {
        restaurantService.patchDataNoInput(apiEndpoint: APIEndpoint.setRestaurantFavourite(categoryId, restaurantId, isFavourite), completion: completion)
    }
    
    func fetchRestaurantImages(categoryId: String, restaurantId: String, completion: @escaping (Result<[String], ServiceError>) -> Void ){
        let url = APIEndpoint.getImagesByRestaurant(categoryId, restaurantId)
       return imageService.fetchData(apiEndpoint: url, completion: completion)
    }
    
    func fetchRestaurantByCategoryId(categoryId: String, completion: @escaping (Result<[Restaurant], ServiceError>) -> Void) {
        let url = APIEndpoint.fetchRestaurantByCategoryId(categoryId)
        return restaurantService.fetchData(apiEndpoint: url, completion: completion)
    }
}
