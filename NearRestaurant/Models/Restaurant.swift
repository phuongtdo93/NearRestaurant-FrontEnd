//
//  Restaurant.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import Foundation

struct RestaurantInfo: Decodable {
    let _id: String
    let name: String
    let address: String
    let services: [String]
//    let dishes: [Dish]
    let rate: Float
    let distance: Float
    let longDescription: String
    let shortDescription: String
    let timeOpen: String
    let dayOfWeek: String
    let image: String
//    let isFavourite: Bool
}

struct Restaurant: Decodable {
    
    let categoryId: String
    let categoryName: String
    let restaurantInfo: RestaurantInfo
    
    private enum RestaurantKeys: String, CodingKey {
        case categoryId = "_id"
        case categoryName = "name"
        case restaurants = "restaurants"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RestaurantKeys.self)
        categoryId = try container.decode(String.self, forKey: .categoryId)
        categoryName = try container.decode(String.self, forKey: .categoryName)
        restaurantInfo = try container.decode(RestaurantInfo.self, forKey: .restaurants)
    }
    init(categoryId: String ,categoryName: String, restaurantInfo: RestaurantInfo) {
        self.categoryId = categoryId
        self.categoryName = categoryName
        self.restaurantInfo = restaurantInfo
    }
}
