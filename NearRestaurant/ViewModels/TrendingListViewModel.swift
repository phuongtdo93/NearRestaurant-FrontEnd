//
//  TrendingListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import Foundation

class TrendingListViewModel: ObservableObject {
    @Published var trendingList: [RestaurantViewModel] = []
    private var restaurantService = RestaurantService.instance
    
    init(){
        fetchTrendingList()
    }
    
    func fetchTrendingList() {
        print("fetchTrendingList")
         restaurantService.fetchAllTrending { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.trendingList = data.map(RestaurantViewModel.init)
                case .failure(let err):
                    print("Error in fetchTrendingList \(err)")
                }
            }
        }
    }
}
