//
//  BackButton.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .fontWeight(.bold)
            Text("Back")
        }.foregroundColor(Color(hex: CustomColor.mainRed))
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
