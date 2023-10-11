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
        ZStack(alignment: .leading) {
            CustomImage(urlString: restaurantVM.restaurant.image, width: UIScreen.main.bounds.size.width, height: .infinity)
            VStack(alignment: .leading, spacing: 5) {
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
//                .padding(5)
                
            }
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 10, trailing: 15))
            
            
            
            
        }.frame(width: .infinity, height: 300)
        
    }
}

struct TrendingSquare_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSquareView()
    }
}
