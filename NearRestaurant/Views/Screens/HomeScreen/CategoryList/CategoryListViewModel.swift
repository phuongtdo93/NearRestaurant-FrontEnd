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
                    print("CategoryListViewModel \(err)")
                }
            }
        }
    }
}
