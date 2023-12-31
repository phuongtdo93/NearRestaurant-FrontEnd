//
//  Restaurant.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import Foundation

struct RestaurantInfo: Codable {
    let _id: String?
    let name: String?
    let address: String?
    let services: [String]?
//    let dishes: [Dish]
    let rate: Float?
    let distance: Float?
    let longDescription: String?
    let shortDescription: String?
    let timeOpen: String?
    let dayOfWeek: String?
    let image: String?
    let isFavourite: Bool?
    let latitude: Double?
    let longitude: Double?
}

struct Restaurant: Codable {
    
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
    
    static func previewRestaurant() -> Restaurant {
        return Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Amazonian ingredients, creating a unique and innovative Brazilian dining experience, Amazonian ingredients, creating a unique and innovative Brazilian dining experience", shortDescription: "Amazonian ingredients, creating a unique and innovative Brazilian dining experience", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", isFavourite: true, latitude: 51.5, longitude: -0.15))
    }
}
