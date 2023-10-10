//
//  ContactInfo.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI
import MapKit

struct ContactInfoView: View {
    let contact: ContactViewModel
    
    var body: some View {
        HStack {
            BigCircle(content: "calendar")
            VStack (alignment: .leading){
                Text(contact.timeOpen)
                Text(contact.dayOfWeek)
                    .font(.custom("Arial", size: 14))
            }
            Spacer()
            NavigationLink {
                MapScreen(location: Location(name: "LonDon", latitude: 51.5, longitude: -0.12, fullAddress: ""), mapRegion: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
            } label: {
                BigCircle(content: "location.fill")
            }

            BigCircle(content: "phone.fill")
        }
    }
}

struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoView(contact: ContactViewModel( timeOpen: "08am-12am", dayOfWeek: "Mon to Fri",  phoneNumber: "6438900988"))
    }
}
