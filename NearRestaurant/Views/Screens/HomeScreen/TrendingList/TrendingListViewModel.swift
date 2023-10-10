//
//  TrendingListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import Foundation
import OSLog

class TrendingListViewModel: ObservableObject {
    @Published var trendingList: [RestaurantViewModel] = []
    private let restaurantService: RestaurantServiceProtocol
    
    private let logging = HandleLogging.instance
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
        fetchTrendingList()
    }
    
    func fetchTrendingList() {
         restaurantService.fetchAllTrending { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.trendingList = data.map(RestaurantViewModel.init)
                case .failure(let err):
                    self.logging.error("Error in fetchTrendingList \(err)")
                }
            }
        }
    }
}
