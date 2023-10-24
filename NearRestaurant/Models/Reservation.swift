//
//  Reservation.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/15/23.
//

import Foundation

struct Reservation: Codable {
    let numberOfPeople: Int
    let date: Date
    let restaurant: ReservationRestaurant?
    
    struct ReservationRestaurant: Codable {
        let id: String
        let name: String?
        let image: String?
    }
}
