//
//  NearRestaurantEndpoint.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/9/23.
//

import Foundation

enum NearRestaurantEndpoint {
    static let domain: String = "https://nearrestaurant.glitch.me"
    static let categoriesEndpoint: String = domain + "/categories"
    static let restaurantsEndpoint: String = domain + "/restaurants"
    static let getAllTrending: String = domain + "/restaurants?isTrending=true"
    static let getTop5Restaurant: String = domain + "/restaurants?numOfTop=5"
    
    static let getImagesByRestaurant: (String, String) -> String = { categoryId, restaurantId in
        NearRestaurantEndpoint.domain + "/categories/\(categoryId)/restaurants/\(restaurantId)/images"
    }
    
    static let setRestaurantFavourite: (String, String, Bool) -> String = { categoryId,restaurantId,isFavourite in
        NearRestaurantEndpoint.domain + "\(categoryId)/restaurants/\(restaurantId)?isFavourite=\(isFavourite)"
    }
    
    static let fetchRestaurantByCategoryId: (String) -> String = { categoryId in
        NearRestaurantEndpoint.domain + "/categories/\(categoryId)/restaurants"
    }
}
