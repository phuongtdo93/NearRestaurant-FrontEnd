//
//  CategoryListViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

class CategoryListViewModel: ObservableObject {
    @Published var categoryList = [CategoryViewModel]()
    private let restaurantService: RestaurantServiceProtocol
    private let logging = HandleLogging.instance
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
        fetchCategory()
    }
    
    func fetchCategory () {
        restaurantService.fetchCategory { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.categoryList = data.map(CategoryViewModel.init)
                case .failure(let err):
                    self.logging.error("CategoryListViewModel - fetchCategory failed - \(err)")
                }
            }
        }
    }
}
