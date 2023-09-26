//
//  RestaurantDetails.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct RestaurantDetailsScreen: View {
    var body: some View {
            VStack {
                BannerView()
                Text("This budget-friendly meal plan covers a week's worth of dinners for four adults and two children, coming in at under £35 in total.")
                    .font(.footnote)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                ContactInfoView().padding(10)
                List {
                    NavigationLink {
                        MenuScreen()
                    } label: {
                        Text("Menu")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Reviews")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Images")
                    }
                }
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SearchScreen()
                    } label: {
                        Text("BOOKING")
                            .foregroundColor(.white)
                            .font(.custom("Arial", size: 13))
                            .fontWeight(.bold)
                    }
                    .padding(5)
                    .background(.red)
                    .cornerRadius(20)
                }
            }
    }
        
}

struct RestaurantDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsScreen()
    }
}
