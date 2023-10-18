//
//  RestaurantDetails.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct RestaurantDetailsScreen: View {
    @ObservedObject var restaurantVM: RestaurantWrappedViewModel
    
    var body: some View {
            VStack {
                BannerView(isFavourite: restaurantVM.restaurant.isFavourite)
                    .environmentObject(restaurantVM)
                Text(restaurantVM.restaurant.longDescription)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                ContactInfoView(contact: restaurantVM.restaurant.contactInformation) .padding(10)
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
                        RestaurantImagesScreen(categoryId: restaurantVM.restaurant.categoryId, restaurantId: restaurantVM.restaurant.id)
                    } label: {
                        Text("Images")
                    }
                }
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
//                        SearchScreen()
                        CreateReservationScreen(restaurantName: restaurantVM.restaurant.name, restaurantAddress: restaurantVM.restaurant.address, optionList: ["1 person", "2 persons"])
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
        RestaurantDetailsScreen(restaurantVM: RestaurantWrappedViewModel(restaurant: RestaurantViewModel(restaurant: Restaurant.previewRestaurant())))
    }
}
