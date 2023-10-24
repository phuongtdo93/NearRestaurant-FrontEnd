//
//  RestaurantListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation
import OSLog

class RestaurantListViewModel: ObservableObject {
    @Published var restaurantList: [RestaurantWrappedViewModel] = []
    private let restaurantService: RestaurantServiceProtocol
    private let handleLogging = HandleLogging.instance
    
    init(restaurantService: RestaurantServiceProtocol){
        self.restaurantService = restaurantService
        fetchRestaurant()
        handleLogging.info("Hello this is my application")
            
    }
    
    func fetchRestaurant(){
        restaurantService.fetchRestaurant { result in
            DispatchQueue.main.async {
                print(result)
                switch result {
                case .success(let data):
                    self.restaurantList = data.map(RestaurantViewModel.init).map(RestaurantWrappedViewModel.init)
                case .failure(let err):
                    self.handleLogging.error("Error RestaurantListViewModel \(err)")
                }
            }
        }
    }
}
