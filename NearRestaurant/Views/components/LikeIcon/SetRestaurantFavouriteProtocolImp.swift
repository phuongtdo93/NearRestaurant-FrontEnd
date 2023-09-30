//
//  LikeIconRestaurantViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/5/23.
//

import Foundation
import OSLog

struct SetRestaurantFavouriteProtocolImp: SetFavouriteProtocol {
    
    private var restaurantService: RestaurantService?
    private var handleLogging: Logger?
    
    init(){
        restaurantService = RestaurantService.instance
        handleLogging = HandleLogging.instance
    }
    
    func setFavourite(restaurant: RestaurantFavourite) async -> Bool {
        return await withCheckedContinuation({ continuation in
            restaurantService?.setFavouriteRestaurant(categoryId: restaurant.categoryId, restaurantId: restaurant.restaurantId, isFavourite: restaurant.isFavourite) { response in
                DispatchQueue.main.async {
                    switch response {
                    case .success(let res):
                        continuation.resume(returning: res)
                    case .failure(let err):
                        handleLogging?.error("setFavourite failed: \(err)")
                    }
                }
                
            }
        })
    }
}
