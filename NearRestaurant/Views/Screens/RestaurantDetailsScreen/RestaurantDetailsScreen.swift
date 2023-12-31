//
//  RestaurantDetails.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct RestaurantDetailsScreen: View {
    @ObservedObject var restaurantVM: RestaurantWrappedViewModel
    @ObservedObject var userStatusValidationVM: LoginNavigationViewModel
    
    
    init(restaurantVM: RestaurantWrappedViewModel, userStatusValidationVM: LoginNavigationViewModel) {
        self.restaurantVM = restaurantVM
        self.userStatusValidationVM = userStatusValidationVM
    }
    
    var body: some View {
            VStack {
                BannerView(isFavourite: restaurantVM.restaurant.isFavourite)
                    .environmentObject(restaurantVM)
                Text(restaurantVM.restaurant.longDescription)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                ContactInfoView(contact: restaurantVM.restaurant.contactInformation) .padding(10)
                Spacer()
                
            }
            .ignoresSafeArea()
    }
        
}

struct RestaurantDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsScreen(restaurantVM: RestaurantWrappedViewModel(restaurant: RestaurantViewModel(restaurant: Restaurant.previewRestaurant())), userStatusValidationVM: LoginNavigationViewModel(userStatusValidationService: UserStatusValidation()))
    }
}
