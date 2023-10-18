//
//  SetFavouriteProtocol.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/18/23.
//

import Foundation

protocol SetFavouriteProtocol {
    func setFavourite(restaurant: RestaurantFavourite) async -> Bool
}
