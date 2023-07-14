//
//  Trending.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/28/23.
//

import SwiftUI

struct TrendingSquare: View {
    var restaurant: RestaurantViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            CustomImage(urlString: restaurant.image, width: UIScreen.main.bounds.size.width, height: .infinity)
            VStack(alignment: .leading, spacing: 5) {
                Text("TRENDING")
                    .foregroundColor(.white)
                    .font(.headline)
                Text(restaurant.name)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title2)
                Text(restaurant.shortDescription)
                    .foregroundColor(.white)
                    .font(.footnote)
                    .animation(.easeInOut)
                Spacer()
//                .padding(5)
                
            }
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 10, trailing: 15))
            
            
            
            
        }.frame(width: .infinity, height: 300)
        
    }
}

struct TrendingSquare_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSquare(restaurant: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short description for me restaurant", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage"))))
    }
}
