//
//  MockSetRestaurantFavourite.swift
//  NearRestaurantUITests
//
//  Created by Salmdo on 10/18/23.
//

import Foundation


struct MockSetRestaurantFavourite: SetFavouriteProtocol {
    func setFavourite(restaurant: RestaurantFavourite) async -> Bool {
        return restaurant.isFavourite
    }
    
    
}
