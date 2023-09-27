//
//  RestaurantImagesView.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/27/23.
//

import SwiftUI

struct RestaurantImagesScreen: View {
    
    var categoryId: String
    var restaurantId: String
    @ObservedObject private var restaurantImageVM:  RestaurantImageViewModel
    
    init(categoryId: String, restaurantId: String) {
        self.categoryId = categoryId
        self.restaurantId = restaurantId
        self.restaurantImageVM = RestaurantImageViewModel(categoryId: categoryId, restaurantId: restaurantId)
    }
    
    
    let data = (1...100).map {
        "Item \($0)"
    }
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        if restaurantImageVM.isLoading {
            Image(systemName: "rays")
                .resizable()
                .frame(width: 50, height: 50)
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(restaurantImageVM.images, id: \.self) { item in
                        Image(uiImage: item)
                    }
                }
            }
        }
    }
}

struct RestaurantImagesScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantImagesScreen(categoryId: "64a01af9372d0c7ce7802f5c", restaurantId: "64ad11a7558d90ebd1356c2f")
    }
}