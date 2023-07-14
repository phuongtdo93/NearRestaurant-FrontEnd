//
//  RestaurantItemHorizontal.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct RestaurantItemHorizontal: View {
    var restaurantVM: RestaurantViewModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                CustomImage(urlString: restaurantVM.image, width: UIScreen.main.bounds.width, height: 200)
                HStack {
                    InfoTag(showStar: true, textStr: restaurantVM.rate)
                    Spacer()
                    LikeIcon(padding: 7)
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
    }
}

struct RestaurantItemHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItemHorizontal(restaurantVM: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage"))))
    }
}
