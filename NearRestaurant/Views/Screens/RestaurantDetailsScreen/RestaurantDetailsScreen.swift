//
//  RestaurantDetails.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct RestaurantDetailsScreen: View {
    let restaurantVM: RestaurantViewModel
    
    var body: some View {
            VStack {
                BannerView(isFavourite: restaurantVM.isFavourite, restaurantVM: restaurantVM)
                Text(restaurantVM.longDescription)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                ContactInfoView(restaurantVM: restaurantVM).padding(10)
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
                        RestaurantImagesScreen(categoryId: restaurantVM.categoryId, restaurantId: restaurantVM.id)
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
        RestaurantDetailsScreen(restaurantVM: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", isFavourite: false))))
    }
}
