//
//  CategoryViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import Foundation

struct CategoryViewModel: Identifiable {
    let category: Category
    
    
    var id: String {
        category._id
    }
    

    var name: String {
        category.name
    }
    
}
