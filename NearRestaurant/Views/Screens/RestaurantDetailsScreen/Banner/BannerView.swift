//
//  Banner.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct BannerView: View {
    @State var isFavourite = true
    var restaurantVM: RestaurantViewModel
    private let setFavouriteProtocol = SetRestaurantFavouriteProtocolImp()
    
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
        BannerView(restaurantVM: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI", "Parking", "Karaoke"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", isFavourite: false))))
    }
}
