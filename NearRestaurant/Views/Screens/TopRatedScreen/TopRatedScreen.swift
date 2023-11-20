//
//  TopRated.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct TopRatedScreen: View {
    var body: some View {
        VStack {
            TrendingSquareView()
            TopRatedListView()
            
            
        }.padding()
    }
}

struct TopRatedScreen_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedScreen()
            .environmentObject(RestaurantWrappedViewModel(restaurant: RestaurantViewModel(restaurant: Restaurant.previewRestaurant())))
    }
}
