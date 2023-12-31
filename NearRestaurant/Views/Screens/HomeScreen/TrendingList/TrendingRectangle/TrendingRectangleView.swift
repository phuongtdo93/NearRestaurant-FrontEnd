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
                    .accessibilityIdentifier("idRestaurantName")
                HStack(alignment: .bottom) {
                    Spacer()
                    NavigationLink {
                        TopRatedScreen()
                        .environmentObject(restaurantVM)
                        
                    } label: {
                        Text("SEE TOP RATED")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(10)
                            .accessibilityIdentifier("idTopRatedScreenNavigationLinkInTrendingRectangleView")
                    }
                    

                }
                
            }.padding(10)
            
        }
        
        .fixedSize()
        
        
    }
}

struct TrendingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        TrendingRectangleView(restaurantVM: RestaurantWrappedViewModel(restaurant:  RestaurantViewModel(restaurant: Restaurant.previewRestaurant())))
    }
}
