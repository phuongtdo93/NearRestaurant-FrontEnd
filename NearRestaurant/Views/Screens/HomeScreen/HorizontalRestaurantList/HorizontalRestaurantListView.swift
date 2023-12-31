//
//  RestaurantListNearYou.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import SwiftUI

struct HorizontalRestaurantListView: View {
    @StateObject private var restaurant = RestaurantListViewModel(restaurantService: RestaurantService.instance)

    var body: some View {
        VStack(alignment: .leading) {
            Text("Near you")
                .font(.title2)
            .fontWeight(.bold)

            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(restaurant.restaurantList, id: \.id) { restaurantItem in
                        RestaurantItemVerticalView(isFavourite: restaurantItem.restaurant.isFavourite, restaurantVM: restaurantItem)
                    }
                }.fixedSize()
            }
            .accessibilityIdentifier("idHorizontalRestaurantListView")
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        }

    }
}

struct HorizontalRestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRestaurantListView()
    }
}
