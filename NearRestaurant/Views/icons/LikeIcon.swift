//
//  LikeIcon.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI

struct LikeIcon: View {
    var showStroke: Bool?
    var padding: CGFloat?
    
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .foregroundColor(.gray)
            .frame(width: 20, height: 20)
            .padding(padding ?? 10)
            .background(.white)
            .cornerRadius(100)
            .overlay {
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.gray, lineWidth: showStroke ?? false ? 1 : 0)
            }
        
    }
}

struct LikeIcon_Previews: PreviewProvider {
    static var previews: some View {
        LikeIcon(showStroke: true)
    }
}
