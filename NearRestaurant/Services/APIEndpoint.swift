//
//  NearRestaurantEndpoint.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/9/23.
//

import Foundation

enum APIEndpoint {
    static let domain: String = "https://nearrestaurant.glitch.me"
    static let categoriesEndpoint: String = domain + "/categories"
    static let restaurantsEndpoint: String = domain + "/categories/restaurants"
    static let getAllTrending: String = domain + "/categories/restaurants?isTrending=true"
    static let getTop5Restaurant: String = domain + "/categories/restaurants?numOfTop=5"
    static let reservations: String = domain + "/reservations"
    static let signup: String = domain + "/users/signup"
    static let login: String = domain + "/users/login"
    
    static let getImagesByRestaurant: (String, String) -> String = { categoryId, restaurantId in
        APIEndpoint.domain + "/categories/\(categoryId)/restaurants/\(restaurantId)/images"
    }
    
    static let setRestaurantFavourite: (String, String, Bool) -> String = { categoryId,restaurantId,isFavourite in
        APIEndpoint.domain + "\(categoryId)/restaurants/\(restaurantId)?isFavourite=\(isFavourite)"
    }
    
    static let fetchRestaurantByCategoryId: (String) -> String = { categoryId in
        APIEndpoint.domain + "/categories/\(categoryId)/restaurants"
    }
}
