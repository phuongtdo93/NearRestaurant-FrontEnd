//
//  CategoryViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

struct CategoryViewModel: Identifiable {
    private let category: Category
    init(category: Category) {
        self.category = category
    }
    
    
    var id: String {
        category._id
    }
    

    var name: String {
        category.name ?? ""
    }
    
}
