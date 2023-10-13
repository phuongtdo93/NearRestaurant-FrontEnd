//
//  SwiftUIView.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct InfoTag: View {
    var showStar: Bool?
    let textStr: String
    var showStroke: Bool?
    var body: some View {
        HStack {
            if showStar ?? false {
                Image(systemName: "star.fill")
                    .foregroundColor(.red)
            }
            Text(textStr)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(EdgeInsets(top: 3, leading: 7, bottom: 3, trailing: 7))
        .background(.white)
        .font(.custom("Arial", size: 10))
        .cornerRadius(5)
            .overlay (
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: showStroke ?? false ? 1 : 0)
            )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoTag(showStar: true, textStr: "$.9", showStroke: true)
    }
}
