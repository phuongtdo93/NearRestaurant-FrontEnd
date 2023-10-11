//
//  TopRated.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct TopRatedScreen: View {
    @EnvironmentObject var trendingRestaurant: RestaurantWrappedViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text("Restaurants")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("New York, USA \(trendingRestaurant.restaurant.name)")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
                UserIcon()
            }
            
//            TrendingSquareView()
            TopRatedListView()
            
            
        }.padding()
    }
}

struct TopRatedScreen_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedScreen()
    }
}
