//
//  RestaurantItem1.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct RestaurantItemVerticalView: View {
    var restaurantVM: RestaurantWrappedViewModel
    private let setFavouriteProtocol = SetRestaurantFavouriteProtocolImp(restaurantService:  RestaurantService.instance)
    @State private var isFavourite: Bool = false
    
    init(isFavourite: Bool, restaurantVM: RestaurantWrappedViewModel){
        self.restaurantVM = restaurantVM
        self.isFavourite = isFavourite

    }
    
    var body: some View {
        NavigationLink {
            RestaurantDetailsScreen(restaurantVM: restaurantVM, userStatusValidationVM: LoginNavigationViewModel(userStatusValidationService: UserStatusValidation()))
        } label: {
            VStack (alignment: .leading, spacing: 7) {
                ZStack(alignment: .top) {
                    CustomImage(urlString: restaurantVM.restaurant.image, width: 160, height: 130)
                    
                    HStack(alignment: .top) {
                        InfoTag(showStar: true, textStr: "3.4", showStroke: true)
                        Spacer()
                    }.padding(10)
                }
                Text(restaurantVM.restaurant.name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .lineSpacing(4)
                    .lineLimit(3)
                    .padding(2)
                Text(restaurantVM.restaurant.address)
                    .font(.caption2)
                    .foregroundColor(.gray)
                InfoTag(textStr: restaurantVM.restaurant.distance, showStroke: true)
                
            }
            .frame(maxWidth: 150)
        }
        .accessibilityIdentifier("idLikeIconRestaurantItemVerticalView")
    }
}

struct RestaurantItemVehicle_Previews: PreviewProvider {
  
   static var previews: some View {
       RestaurantItemVerticalView(isFavourite: true, restaurantVM: RestaurantWrappedViewModel(restaurant: RestaurantViewModel(restaurant: Restaurant.previewRestaurant())))

   }
}

