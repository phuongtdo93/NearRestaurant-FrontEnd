//
//  Banner.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct BannerView: View {
    @State var isFavourite = true
    let restaurantVM: RestaurantViewModel
    private let setFavouriteProtocol = SetRestaurantFavouriteProtocolImp(restaurantService: RestaurantService.instance)
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            CustomImage(urlString: restaurantVM.image, height: 300)
                
            VStack (alignment: .leading) {
                HStack{
                    InfoTag(showStar: true, textStr: restaurantVM.rate)
                    InfoTag(textStr: restaurantVM.distance)
                }
                Text(restaurantVM.name)
                    .font(.custom("Arial", size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(restaurantVM.address)
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                HStack {
                    ForEach(restaurantVM.services, id: \.self) { item in
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
    static var previews: some View {
        BannerView(restaurantVM: RestaurantViewModel(restaurant: Restaurant.previewRestaurant()))
    }
}
