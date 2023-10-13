//
//  SwiftUIView.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/28/23.
//

import SwiftUI

struct RestaurantItemView: View {
    let restaurantVM: RestaurantViewModel
    @State var isFavourite: Bool = false
    
    private let setFavouriteProtocol = SetRestaurantFavouriteProtocolImp(restaurantService:  RestaurantService.instance)
    
    var body: some View {
        HStack (){
            CustomImage(urlString: restaurantVM.image, width: 100, height: 100)

            VStack (alignment: .leading, spacing: 15) {
                Text(restaurantVM.name)
                Text(restaurantVM.address)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
                InfoTag(showStar: true, textStr: restaurantVM.rate, showStroke: true)
            }
            Spacer()
            VStack (spacing: 20) {
                LikeIcon(showStroke: true, padding: 10, isFavourite: $isFavourite, setFavouriteProtocol: setFavouriteProtocol, restaurantFavourite: RestaurantFavourite(categoryId: restaurantVM.categoryId, restaurantId: restaurantVM.id))
                InfoTag(textStr: restaurantVM.distance, showStroke: true)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
    }
}

struct RestaurantItem_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItemView(restaurantVM: RestaurantViewModel(restaurant: Restaurant.previewRestaurant()))
    }
}
