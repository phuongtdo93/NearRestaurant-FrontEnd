//
//  TopRatedListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import Foundation

class TopRatedListViewModel: ObservableObject {
    @Published var topRatedListVM: [RestaurantViewModel] = []
    let delayInSeconds = 0
    
    private var restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
    }
    
    func fetchTop5Restaurant() {
        restaurantService.fetchTop5Restaurant { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.topRatedListVM = data.map(RestaurantViewModel.init)
                case .failure(let err):
                    print("Error fetchTop5Restaurant \(err)")
                }
            }
        }
    }
}
