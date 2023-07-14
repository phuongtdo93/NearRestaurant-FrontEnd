//
//  ContactInfo.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct ContactInfo: View {
    var body: some View {
        HStack {
            BigCircle(content: "calendar")
            VStack (alignment: .leading){
                Text("07:00 - 22: 00")
                Text("Monday to Sunday")
                    .font(.custom("Arial", size: 14))
            }
            Spacer()
            BigCircle(content: "location.fill")
            BigCircle(content: "phone.fill")
        }
    }
}

struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfo()
    }
}
