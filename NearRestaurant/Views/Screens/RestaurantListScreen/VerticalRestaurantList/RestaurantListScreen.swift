//
//  BigRestaurantListNearYou.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import SwiftUI

struct RestaurantListScreen: View {
    let categoryId: String
    @StateObject private var verticalRestaurantListVM = RestaurantListScreenViewModel(restaurantService: RestaurantService.instance)
    
    init(categoryId: String) {
        self.categoryId = categoryId
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView() {
                LazyVStack {
                    ForEach(verticalRestaurantListVM.restaurants, id: \.id) { restaurant in
                        RestaurantItemHorizontalView(restaurantVM: restaurant)
                    }
                }
            }
            
        }
        .onAppear() {
            verticalRestaurantListVM.fetchRestaurantByCategoryId(categoryId: categoryId)
        }
        .navigationTitle(Text("Restaurant list"))
    }
}

struct RestaurantListScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListScreen(categoryId: "64ad211acde3b553079129f1")
    }
}
