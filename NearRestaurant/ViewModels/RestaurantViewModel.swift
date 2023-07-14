//
//  RestaurantViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

struct RestaurantViewModel: Identifiable {
    let restaurant: Restaurant
    
    var categoryIs: String {
        restaurant.categoryId
    }
    
    var id: String {
        restaurant.restaurantInfo._id
    }
    var name: String {
        restaurant.restaurantInfo.name
    }
    var address: String {
        restaurant.restaurantInfo.address
    }
    var services: [String] {
        restaurant.restaurantInfo.services
    }
    var rate: String {
        String(format: "%.1f", restaurant.restaurantInfo.rate)
    }
    var distance: String {
        String(format: "%.2f", restaurant.restaurantInfo.distance) + " km"
    }
    var longDescription: String {
        restaurant.restaurantInfo.longDescription
    }
    var shortDescription: String {
        restaurant.restaurantInfo.shortDescription
    }
    var shortDescriptionCut: String {
        String(restaurant.restaurantInfo.shortDescription.prefix(20))
    }
    var timeOpen: String {
        restaurant.restaurantInfo.timeOpen
    }
    var dayOfWeek: String {
        restaurant.restaurantInfo.dayOfWeek
    }
    var image: String {
        restaurant.restaurantInfo.image
    }
}
