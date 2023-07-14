//
//  RestaurantListNearYou.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import SwiftUI

struct SmallRestaurantListNearYou: View {
    @EnvironmentObject var restaurant: RestaurantListViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Near you")
                .font(.title2)
            .fontWeight(.bold)
            
            ScrollView(.horizontal) {
                LazyHStack() {
                    ForEach(restaurant.restaurantList, id: \.id) { restaurantItem in
                        RestaurantItemVehicle(restaurantVM: restaurantItem)
                    }
                }.fixedSize()
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        
    }
}

struct SmallRestaurantListNearYou_Previews: PreviewProvider {
    static var previews: some View {
        SmallRestaurantListNearYou().environmentObject(RestaurantListViewModel())
    }
}
