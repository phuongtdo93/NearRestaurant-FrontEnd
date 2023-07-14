//
//  SwiftUIView.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/28/23.
//

import SwiftUI

struct RestaurantItem: View {
    var restaurantVM: RestaurantViewModel
    
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
                LikeIcon(showStroke: true, padding: 6)
                InfoTag(textStr: restaurantVM.distance, showStroke: true)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
    }
}

struct RestaurantItem_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItem(restaurantVM: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage"))))
    }
}
