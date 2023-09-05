//
//  LikeIconRestaurantViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/5/23.
//

import Foundation

class LikeIconRestaurantViewModel: ObservableObject {
    
    private var restaurantService: RestaurantService
    var categoryId: String = ""
    var restaurantId: String = ""
    
    
//    @Published isFavourite
    
    init(restaurantService: RestaurantService, categoryId: String, restaurantId: String){
        self.restaurantService = restaurantService
        self.categoryId = categoryId
        self.restaurantId = restaurantId
    }
    
    func updateRestaurantFavourite(isFavourite: Bool) {
        restaurantService
    }
}
