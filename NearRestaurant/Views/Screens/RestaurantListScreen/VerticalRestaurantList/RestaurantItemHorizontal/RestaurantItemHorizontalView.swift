//
//  RestaurantItemHorizontal.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct RestaurantItemHorizontalView: View {
    let restaurantVM: RestaurantViewModel!
    let setFavouriteProtocol: SetFavouriteProtocol = SetRestaurantFavouriteProtocolImp(restaurantService:  RestaurantService.instance)
    @State var isFavourite: Bool = false

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                CustomImage(urlString: restaurantVM.image, height: 200)
                HStack {
                    InfoTag(showStar: true, textStr: restaurantVM.rate)
                    Spacer()
                }.padding()
            }
            HStack(alignment: .top) {
                VStack (alignment: .leading, spacing: 5){
                    Text(restaurantVM.name)
                        .font(.headline)
                    Text(restaurantVM.address)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                InfoTag(textStr: restaurantVM.distance, showStroke: true)
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15))
        }
        .frame(width: UIScreen.main.bounds.width)
        .onAppear(){
            isFavourite = restaurantVM.isFavourite
        }
    }
}

struct RestaurantItemHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItemHorizontalView(restaurantVM: RestaurantViewModel(restaurant: Restaurant.previewRestaurant()))
    }
}
