//
//  TrendingRectangle.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct TrendingRectangleView: View {
   @ObservedObject var restaurantVM: RestaurantWrappedViewModel
    
    var body: some View {
        ZStack {
            CustomImage(urlString: restaurantVM.restaurant.image, width: 300, height: 160)
            VStack (alignment: .leading, spacing: 5){
                Text("TRENDING")
                    .foregroundColor(.white)
                    .font(.caption2)
                    .fontWeight(.bold)
                Spacer()
                Text(restaurantVM.restaurant.name)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                HStack(alignment: .bottom) {
                    Text(restaurantVM.restaurant.shortDescriptionCut)
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(width: 150, height: .infinity)
                    Spacer()
                    NavigationLink {
                        TopRatedScreen()
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
        .environmentObject(restaurantVM)
        
    }
}

struct TrendingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        TrendingRectangleView(restaurantVM: RestaurantWrappedViewModel(restaurant:  RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", isFavourite: true, latitude: 51.5, longitude: -0.15)))))
    }
}
