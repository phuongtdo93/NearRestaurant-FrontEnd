//
//  LikeIconDishViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/20/23.
//

import Foundation
import OSLog


struct LikeIconDishViewModel: SetFavouriteProtocol {
    
    private var restaurantService: RestaurantServiceProtocol?
    private var handleLogging: Logger?
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
        self.handleLogging = HandleLogging.instance
    }
    
    
    func setFavourite(restaurant: RestaurantFavourite) async -> Bool {
        //TODO
        return true
    }
    
    
}
