//
//  BigRestaurantListNearYou.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import SwiftUI

struct VerticalRestaurantListView: View {
    let categoryId: String
    @StateObject private var verticalRestaurantListVM = VerticalRestaurantListViewModel(restaurantService: RestaurantService.instance)
    
    init(categoryId: String) {
        self.categoryId = categoryId
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
              LongButtonWithIconView(text: "SORT BY", icon: "text.alignleft")
              LongButtonWithIconView(text: "FILTERS", icon: "slider.horizontal.3")
            }
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(verticalRestaurantListVM.restaurants, id: \.id) { restaurant in
                        RestaurantItemHorizontalView(restaurantVM: restaurant)
                    }
                }
            }
            
        }.padding()
        .onAppear() {
            verticalRestaurantListVM.fetchRestaurantByCategoryId(categoryId: categoryId)
        }
    }
}

struct BigRestaurantListNearYou_Previews: PreviewProvider {
    static var previews: some View {
        VerticalRestaurantListView(categoryId: "64ad211acde3b553079129f1")
    }
}
