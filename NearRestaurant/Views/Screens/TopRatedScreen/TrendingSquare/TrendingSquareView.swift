//
//  Trending.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/28/23.
//

import SwiftUI

struct TrendingSquareView: View {
    @EnvironmentObject var restaurantVM: RestaurantWrappedViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            CustomImage(urlString: restaurantVM.restaurant.image, width: UIScreen.main.bounds.size.width, height: 300)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.5))
            .frame(width: UIScreen.main.bounds.width, height: 150)
            
            
            
            VStack(alignment: .listRowSeparatorLeading, spacing: 5) {
                Text("TRENDING")
                    .foregroundColor(.white)
                    .font(.headline)
                Text(restaurantVM.restaurant.name)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title2)
                Text(restaurantVM.restaurant.shortDescription)
                    .foregroundColor(.white)
                    .font(.footnote)
                    .animation(.easeInOut)
                Spacer()
            }
            
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 10, trailing: 15))
        }.frame(width: UIScreen.main.bounds.width, height: 300)
        
    }
}

struct TrendingSquare_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSquareView().environmentObject(RestaurantWrappedViewModel(restaurant: RestaurantViewModel(restaurant: Restaurant.previewRestaurant())))
    }
}
