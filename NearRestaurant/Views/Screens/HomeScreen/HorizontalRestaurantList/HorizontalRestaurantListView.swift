//
//  RestaurantListNearYou.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import SwiftUI

struct
HorizontalRestaurantListView: View {
    @EnvironmentObject var restaurant: RestaurantListViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Near you")
                .font(.title2)
            .fontWeight(.bold)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(restaurant.restaurantList, id: \.id) { restaurantItem in
                        RestaurantItemVerticalView(isFavourite: restaurantItem.isFavourite, restaurantVM: restaurantItem)
                    }
                }.fixedSize()
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        
    }
}

struct HorizontalRestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRestaurantListView().environmentObject(RestaurantListViewModel(restaurantService: RestaurantService.instance))
    }
}
