//
//  Category.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import Foundation

struct Category: Codable, Equatable {
    let _id: String
    let name: String?
//    let restaurant: [Restaurant]
    init(id: String, name: String) {
        self._id = id
        self.name = name
    }
}
