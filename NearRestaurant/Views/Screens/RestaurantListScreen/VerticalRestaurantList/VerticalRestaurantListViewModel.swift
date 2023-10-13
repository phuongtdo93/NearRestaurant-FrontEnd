//
//  VerticalRestaurantListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/12/23.
//

import Foundation

import OSLog


class VerticalRestaurantListViewModel: ObservableObject {
    @Published var restaurants: [RestaurantViewModel] = []
    private let restaurantService: RestaurantServiceProtocol
    private let logging = HandleLogging.instance
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantByCategoryId(categoryId: String) {
       restaurantService.fetchRestaurantByCategoryId(categoryId: categoryId, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.restaurants = data.map(RestaurantViewModel.init)
                case .failure(let err):
                    self.logging.error("VerticalRestaurantListViewModel fetchRestaurantByCategoryId failed: \(err)")
                }
            }
        })
    }
}
