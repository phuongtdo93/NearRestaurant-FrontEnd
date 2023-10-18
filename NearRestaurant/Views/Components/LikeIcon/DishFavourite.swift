//
//  DishFavourite.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/18/23.
//

import Foundation

class DishFavourite: RestaurantFavourite {
    let dishId: String
    
    init(categoryId: String, restaurantId: String, dishId: String) {
        self.dishId = dishId
        super.init(categoryId: categoryId, restaurantId: restaurantId)
    }
}
