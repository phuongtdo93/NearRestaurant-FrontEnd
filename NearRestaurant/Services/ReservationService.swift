//
//  ReservationService.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/22/23.
//

import Foundation


protocol ReservationProtocol {
    func createReservation(reservation: Reservation, completion: @escaping( (Result<Reservation?, ServiceError>)-> Void))
}

struct ReservationService: ReservationProtocol {
    let utilityService = UtilityService<Reservation>()
    
    static let instance = ReservationService()
    
    private init() { }
    
    func createReservation(reservation: Reservation, completion: @escaping ((Result<Reservation?, ServiceError>) -> Void)) {
        utilityService.pushData(apiEndpoint: NearRestaurantEndpoint.reservations, input: reservation, completion: completion)
    }
    
    
}
