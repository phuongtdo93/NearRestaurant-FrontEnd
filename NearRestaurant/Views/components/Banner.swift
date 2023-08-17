//
//  Banner.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            Image ("image1")
                .resizable()
                .frame(width: .infinity, height: 300)
                .aspectRatio(contentMode: .fit)
                
            VStack (alignment: .leading) {
                
                
                HStack{
                    InfoTag(showStar: true, textStr: "4.9")
                    InfoTag(textStr: "2.8 km")
                }
                Text("The restaurant name")
                    .font(.custom("Arial", size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Address")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                HStack {
                    InfoTag(textStr: "WI-FI")
                    InfoTag(textStr: "Parking")
                    InfoTag(textStr: "BAR")
                    Spacer()
                    LikeIconRestaurant()
                }
                }
            .padding(10)
            }
        }
    }

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
