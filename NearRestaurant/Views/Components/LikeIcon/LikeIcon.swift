//
//  LikeIcon.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct LikeIcon: View {
    var showStroke: Bool?
    var padding: CGFloat?
    @Binding var isFavourite: Bool

    let setFavouriteProtocol: SetFavouriteProtocol
    var restaurantFavourite: RestaurantFavourite?

    var body: some View {
        Button {
            performClick()
        } label: {
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(isFavourite == true ? .red : .gray)
                .frame(width: 20, height: 20)
                .padding(padding ?? 10)
                .background(.white)
                .cornerRadius(100)
                .overlay {
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(.gray, lineWidth: showStroke ?? false ? 1 : 0)
                }
                .accessibilityIdentifier("imgHeartLikeIcon")
        }
    }
    
    func performClick() {

        guard let restaurantFavourite else {
            return
        }
        isFavourite.toggle()
        restaurantFavourite.isFavourite = isFavourite
        Task {

            let response =  await setFavouriteProtocol.setFavourite(restaurant: restaurantFavourite)
            if response && isFavourite == true {
                isFavourite = true
            } else {
                isFavourite = false
            }
        }
    }
}

struct LikeIcon_Previews: PreviewProvider {
    static let restaurant = RestaurantFavourite(categoryId: "64a0b33eec6e7df2d85d75f5", restaurantId: "64a0b33eec6e7df2d85d75f6")
    
    static let likeIconRestaurantVM = SetRestaurantFavouriteProtocolImp(restaurantService: RestaurantService.instance)
    
    static var previews: some View {
        LikeIcon(isFavourite: .constant(true), setFavouriteProtocol: LikeIcon_Previews.likeIconRestaurantVM, restaurantFavourite: LikeIcon_Previews.restaurant)
    }
}
