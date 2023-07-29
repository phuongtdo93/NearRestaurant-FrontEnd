//
//  Reservation.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/15/23.
//

import Foundation

struct Reservation {
    let numberOfPeople: Int
    let date: Date
    let time: String
}

struct ReservationFormValidator {
    func isNumberOfPeopleValid(numberOfPeople: Int) -> Bool {
        return numberOfPeople > 0
    }
}
