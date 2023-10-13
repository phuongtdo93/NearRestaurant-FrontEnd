//
//  Banner.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct BannerView: View {
    @State var isFavourite = true
    @EnvironmentObject var restaurantVM: RestaurantWrappedViewModel
    private let setFavouriteProtocol = SetRestaurantFavouriteProtocolImp(restaurantService: RestaurantService.instance)
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            CustomImage(urlString: restaurantVM.restaurant.image, height: 300)
                
            VStack (alignment: .leading) {
                HStack{
                    InfoTag(showStar: true, textStr: restaurantVM.restaurant.rate)
                    InfoTag(textStr: restaurantVM.restaurant.distance)
                }
                Text(restaurantVM.restaurant.name)
                    .font(.custom("Arial", size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(restaurantVM.restaurant.address)
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                HStack {
                    ForEach(restaurantVM.restaurant.services, id: \.self) { item in
                        InfoTag(textStr: item)
                    }
                    Spacer()
                    LikeIcon(showStroke: true, padding: 10, isFavourite: $isFavourite, setFavouriteProtocol: setFavouriteProtocol, restaurantFavourite: RestaurantFavourite(categoryId: "", restaurantId: ""))
                }
                }
            .padding(10)
            }
        }
    }

struct Banner_Previews: PreviewProvider {
    static var previews: some View {(
        BannerView()
            .environmentObject(RestaurantWrappedViewModel(restaurant: RestaurantViewModel(restaurant: Restaurant.previewRestaurant())))
    )}
}
