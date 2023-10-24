//
//  ReservationViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/22/23.
//

import Foundation

class CreateReservationViewModel: ObservableObject {
    let restaurantId = ""
    let restaurantName: String? = ""
    let restaurantImage: String? = ""
    var numberOfPersons = ""
    var createdDate = Date.now
    @Published var reservationCreatedResult = ReserveStatus.New
    
    private var reservationService: ReservationProtocol!
    
    init(reservationService: ReservationProtocol) {
        self.reservationService = reservationService
    }
    
    func createReservation(){
        
        guard let number = Int(numberOfPersons.split(separator: " ").first ?? "0"),  number > 0
        else {
            reservationCreatedResult = .Fail
            return
            
        }
        
        reservationService.createReservation(
            reservation: Reservation(numberOfPeople: number, date: createdDate,
                                     restaurant: Reservation.ReservationRestaurant(id: restaurantId, name: restaurantName, image: restaurantImage))) { result in
                                         DispatchQueue.main.async {
                                             switch result {
                                             case .success( _):
                                                 self.reservationCreatedResult = .Success
                                             case .failure( _):
                                                 self.reservationCreatedResult = .Fail
                                             }
                                         }
                                         
        }
    }
    
    
}
