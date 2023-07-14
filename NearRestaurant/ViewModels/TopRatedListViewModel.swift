//
//  TopRatedListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import Foundation

class TopRatedListViewModel: ObservableObject {
    @Published var topRatedListVM: [RestaurantViewModel] = []
    let delayInSeconds = 3.0
    
    private var restaurantService = RestaurantService.instance
    
    func fetchTop5Restaurant() {
        restaurantService.fetchTop5Restaurant { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delayInSeconds) {
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
