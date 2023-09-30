//
//  ContactInfo.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI
import MapKit

struct ContactInfoView: View {
    let restaurantVM: RestaurantViewModel
    
    var body: some View {
        HStack {
            BigCircle(content: "calendar")
            VStack (alignment: .leading){
                Text(restaurantVM.timeOpen)
                Text(restaurantVM.dayOfWeek)
                    .font(.custom("Arial", size: 14))
            }
            Spacer()
            NavigationLink {
                MapScreen(longitude: 51.5, latitude: -0.12, name: "LonDon", mapRegion: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
            } label: {
                BigCircle(content: "location.fill")
            }

            BigCircle(content: "phone.fill")
        }
    }
}

struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoView(restaurantVM: RestaurantViewModel(restaurant: Restaurant(categoryId: "", categoryName: "", restaurantInfo: RestaurantInfo(_id: "", name: "Bakc name", address: "123 Nblio Holay", services: ["WIFI", "Parking", "Karaoke"], rate: 4.5, distance: 12, longDescription: "Long and long", shortDescription: "Short", timeOpen: "08am-12am", dayOfWeek: "Mon to Fri", image: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage", isFavourite: false))))
    }
}
