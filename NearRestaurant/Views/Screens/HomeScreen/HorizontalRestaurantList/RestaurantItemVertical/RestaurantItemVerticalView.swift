//
//  RestaurantItem1.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct RestaurantItemVerticalView: View {
    var restaurantVM: RestaurantViewModel
    private let setFavouriteProtocol = SetRestaurantFavouriteProtocolImp(restaurantService:  RestaurantService.instance)
    @State private var isFavourite: Bool = false
    
    init(isFavourite: Bool, restaurantVM: RestaurantViewModel){
        self.restaurantVM = restaurantVM
        self.isFavourite = isFavourite

    }
    
    var body: some View {
        NavigationLink {
            RestaurantDetailsScreen(restaurantVM: restaurantVM)
        } label: {
            VStack (alignment: .leading, spacing: 7) {
                ZStack(alignment: .top) {
                    CustomImage(urlString: restaurantVM.image, width: 160, height: 130)
                    
                    HStack(alignment: .top) {
                        InfoTag(showStar: true, textStr: "3.4", showStroke: true)
                        Spacer()
                        LikeIcon(showStroke: false, padding: 10, isFavourite: $isFavourite, setFavouriteProtocol: setFavouriteProtocol, restaurantFavourite:   RestaurantFavourite(categoryId: restaurantVM.categoryId, restaurantId: restaurantVM.id))
                    }.padding(10)
                }
                Text(restaurantVM.name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .lineSpacing(4)
                    .lineLimit(2)
                    .padding(2)
                Text(restaurantVM.address)
                    .font(.caption2)
                    .foregroundColor(.gray)
                InfoTag(textStr: restaurantVM.distance, showStroke: true)
                
            }
            .frame(maxWidth: 150)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct RestaurantItemVehicle_Previews: PreviewProvider {
  
    let restaurantListVM = RestaurantListViewModel(restaurantService: RestaurantService.instance)
   static var previews: some View {
       RestaurantItemVerticalView(isFavourite: true, restaurantVM: RestaurantViewModel(restaurant: Restaurant.previewRestaurant()))

   }
}

