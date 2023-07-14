//
//  BigCircle.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct BigCircle: View {
    var content: String
    var body: some View {
        Image(systemName: content)
            .foregroundColor(.gray)
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.gray, lineWidth: 1)
            }
    }
}

struct BigCircle_Previews: PreviewProvider {
    static var previews: some View {
        BigCircle(content: "calendar")
    }
}
