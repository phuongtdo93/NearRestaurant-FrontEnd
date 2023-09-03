//
//  TrendingRectangle.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct TrendingRectangleView: View {
    var restaurantVM: RestaurantViewModel
    
    var body: some View {
        ZStack {
            CustomImage(urlString: restaurantVM.image, width: 300, height: 160)
            VStack (alignment: .leading, spacing: 5){
                Text("TRENDING")
                    .foregroundColor(.white)
                    .font(.caption2)
                    .fontWeight(.bold)
                Spacer()
                Text(restaurantVM.name)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                HStack(alignment: .bottom) {
                    Text(restaurantVM.shortDescriptionCut)
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(width: 150, height: .infinity)
                    Spacer()
                    NavigationLink {
                        TopRatedScreen(trendingRestaurant: restaurantVM)
                    } label: {
                        Text("SEE ALL")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(10)
                    }

                }
            }.padding(10)
            
        }
        .fixedSize()
    }
}

struct TrendingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        TrendingRectangleView(restaurantVM: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage"))))
    }
}
