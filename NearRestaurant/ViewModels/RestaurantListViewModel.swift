//
//  RestaurantListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

class RestaurantListViewModel: ObservableObject {
    @Published var restaurantList: [RestaurantViewModel] = []
    private let restaurantService = RestaurantService.instance
    
    init(){
        restaurantService.fetchRestaurant { result in
            DispatchQueue.main.async {
                print(result)
                switch result {
                case .success(let data):
                    self.restaurantList = data.map(RestaurantViewModel.init)
                case .failure(let err):
                    print("Error RestaurantListViewModel \(err)")
                }
            }
        }
            
    }
}
