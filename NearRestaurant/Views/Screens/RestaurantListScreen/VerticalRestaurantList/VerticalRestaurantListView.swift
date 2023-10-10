//
//  BigRestaurantListNearYou.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import SwiftUI

struct VerticalRestaurantListView: View {
    @EnvironmentObject var restaurantListVM: RestaurantListViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
              LongButtonWithIconView(text: "SORT BY", icon: "text.alignleft")
              LongButtonWithIconView(text: "FILTERS", icon: "slider.horizontal.3")
            }
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(restaurantListVM.restaurantList, id: \.id) { restaurant in
                        RestaurantItemHorizontalView(restaurantVM: restaurant)
                    }
                }
            }
            
        }.padding()
    }
}

struct BigRestaurantListNearYou_Previews: PreviewProvider {
    static var previews: some View {
        VerticalRestaurantListView().environmentObject(RestaurantListViewModel(restaurantService: RestaurantService.instance))
    }
}
