//
//  RestaurantViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

struct RestaurantViewModel: Identifiable {
    let restaurant: Restaurant
    var contactInformation: ContactViewModel {
        
        let timeOpen = restaurant.restaurantInfo.timeOpen ?? ""
        let dayOfWeek = restaurant.restaurantInfo.dayOfWeek ?? ""
        let locationName = restaurant.restaurantInfo.name ?? ""
//        let phoneNumber = restaurant.restaurantInfo.phoneNumber ?? ""
//        let longitude = restaurant.restaurantInfo.dayOfWeek ?? ""
//        let latitude = restaurant.restaurantInfo.dayOfWeek ?? ""
        
        
        return ContactViewModel(timeOpen: timeOpen, dayOfWeek: dayOfWeek, phoneNumber: "")
    }
    
    var location: Location {
        Location(name: restaurant.restaurantInfo.name, latitude: restaurant.restaurantInfo.latitude , longitude: restaurant.restaurantInfo.longitude, fullAddress: restaurant.restaurantInfo.address ?? "")
    }
    
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

    var image: String {
        restaurant.restaurantInfo.image ?? ""
    }
    
    var isFavourite: Bool {
        restaurant.restaurantInfo.isFavourite ?? false
    }
}
