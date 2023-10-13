//
//  Menu.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import Foundation

struct Dish: Decodable {
    let _id: String?
    let name: String?
    let description: String?
    let rate: Float?
    let price: Float?
    let image: String?
    let isFavourite: Bool?
}
