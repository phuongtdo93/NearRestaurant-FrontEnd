//
//  RestaurantFavourite.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/18/23.
//

import Foundation

class RestaurantFavourite {
    let categoryId: String
    let restaurantId: String
    var isFavourite: Bool = false
    
    init(categoryId: String, restaurantId: String)
    {
        self.categoryId = categoryId
        self.restaurantId = restaurantId
    }
}
