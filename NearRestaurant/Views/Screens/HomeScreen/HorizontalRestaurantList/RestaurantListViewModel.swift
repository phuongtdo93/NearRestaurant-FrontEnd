//
//  RestaurantListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation
import OSLog

class RestaurantListViewModel: ObservableObject {
    @Published var restaurantList: [RestaurantViewModel] = []
    private let restaurantService = RestaurantService.instance
    private let handleLogging = HandleLogging.instance
    
    init(){
        restaurantService.fetchRestaurant { result in
            DispatchQueue.main.async {
                print(result)
                switch result {
                case .success(let data):
                    self.restaurantList = data.map(RestaurantViewModel.init)
                case .failure(let err):
                    self.handleLogging.error("Error RestaurantListViewModel \(err)")
                }
            }
        }
            
    }
}
