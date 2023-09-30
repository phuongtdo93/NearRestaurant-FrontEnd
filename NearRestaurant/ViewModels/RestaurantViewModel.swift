//
//  RestaurantViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

struct RestaurantViewModel: Identifiable {
    let restaurant: Restaurant
    
    var categoryId: String {
        restaurant.categoryId
    }
    
    var id: String {
        restaurant.restaurantInfo._id ?? ""
    }
    var name: String {
        restaurant.restaurantInfo.name ?? ""
    }
    var address: String {
        restaurant.restaurantInfo.address ?? ""
    }
    var services: [String] {
        restaurant.restaurantInfo.services ?? []
    }
    var rate: String {
        String(format: "%.1f", restaurant.restaurantInfo.rate ?? 0.0)
    }
    var distance: String {
        String(format: "%.2f", restaurant.restaurantInfo.distance ?? 0.0) + " km"
    }
    var longDescription: String {
        restaurant.restaurantInfo.longDescription ?? ""
    }
    var shortDescription: String {
        restaurant.restaurantInfo.shortDescription ?? ""
    }
    var shortDescriptionCut: String {
        let des = restaurant.restaurantInfo.shortDescription ?? ""
        return String(des.prefix(20))
    }
    var timeOpen: String {
        restaurant.restaurantInfo.timeOpen ?? ""
    }
    var dayOfWeek: String {
        restaurant.restaurantInfo.dayOfWeek ?? ""
    }
    var image: String {
        restaurant.restaurantInfo.image ?? ""
    }
    
    var isFavourite: Bool {
        restaurant.restaurantInfo.isFavourite ?? false
    }
}
