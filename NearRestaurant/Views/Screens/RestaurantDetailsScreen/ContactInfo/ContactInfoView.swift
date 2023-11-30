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
        }
    }
}

struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoView(contact: ContactViewModel( timeOpen: "08am-12am", dayOfWeek: "Mon to Fri",  phoneNumber: "6438900988"))
    }
}
