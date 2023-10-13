//
//  CategoryStore.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

class CategoryStore: ObservableObject {
    @Published var catetoryList: [Category] = [Category]()
    let categoryService: RestaurantServiceProtocol
    
    init(categoryService: RestaurantServiceProtocol) {
        self.categoryService = categoryService
    }
    
    func fetchCategory(){
        categoryService.fetchCategory { result in
            switch result {
            case .success(let data):
                self.catetoryList = data
            case .failure(let err):
                print(err)
            }
        }
    }
}
