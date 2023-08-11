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
    
    @Binding var isFavorite: Bool
    
    @State private var iconColor: Color = .gray
    
    
    var body: some View {
        Button {
            self.isFavorite.toggle()
            if isFavorite == true {
                iconColor = .red
            } else {
                iconColor = .gray
            }
        } label: {
            
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(iconColor)
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
}

struct LikeIcon_Previews: PreviewProvider {
    static var previews: some View {
        LikeIcon(showStroke: true, isFavorite: .constant(true))
    }
}
