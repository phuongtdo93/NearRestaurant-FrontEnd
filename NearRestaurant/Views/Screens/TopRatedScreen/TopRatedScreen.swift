//
//  TopRated.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct TopRatedScreen: View {
    var trendingRestaurant: RestaurantViewModel
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text("Restaurants")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("New York, USA")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
                UserIcon()
            }
            
            TrendingSquareView(restaurant: trendingRestaurant)
            TopRatedListView()
            
            
        }.padding()
    }
}

struct TopRatedScreen_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedScreen(trendingRestaurant: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", isFavourite: false))))
    }
}
