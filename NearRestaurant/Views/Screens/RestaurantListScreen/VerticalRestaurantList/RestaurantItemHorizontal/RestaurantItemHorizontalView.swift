//
//  RestaurantItemHorizontal.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct RestaurantItemHorizontalView: View {
    let restaurantVM: RestaurantViewModel!
    let setFavouriteProtocol: SetFavouriteProtocol = SetRestaurantFavouriteProtocolImp()
    @State var isFavourite: Bool = false

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                CustomImage(urlString: restaurantVM.image, width: UIScreen.main.bounds.width, height: 200)
                HStack {
                    InfoTag(showStar: true, textStr: restaurantVM.rate)
                    Spacer()
                    LikeIcon(showStroke: true,
                             padding: 10, isFavourite: $isFavourite,
                             setFavouriteProtocol: setFavouriteProtocol,
                             restaurantFavourite: RestaurantFavourite(categoryId: restaurantVM.categoryId, restaurantId: restaurantVM.id))
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
            }
        }
        .onAppear(){
            print("isFavourite: \(restaurantVM.isFavourite)")
            isFavourite = restaurantVM.isFavourite
        }
    }
}

struct RestaurantItemHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItemHorizontalView(restaurantVM: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", isFavourite: true))))
    }
}
