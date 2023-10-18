//
//  ReservationItem.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/16/23.
//

import SwiftUI

struct ReservationItem: View {
    let restaurantImage: String
    let restaurantName: String
    let reservationDateTime: String
    let numberOfPeople: String
    
    var body: some View {
        HStack (){
            CustomImage(urlString: restaurantImage, width: 100, height: 100)

            VStack (alignment: .leading, spacing: 15) {
                Text(restaurantName)
                Text(numberOfPeople)
                Text(reservationDateTime)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
    }
}

struct ReservationItem_Previews: PreviewProvider {
    static var previews: some View {
        ReservationItem(restaurantImage: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", restaurantName: "Restaurant 1", reservationDateTime: "Sep 20, 2023 at 12:12 PM", numberOfPeople: "2 persons")
    }
}
