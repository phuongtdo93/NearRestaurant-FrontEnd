//
//  LongButtonWithIcon.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct LongButtonWithIconView: View {
    let text: String
    let icon: String
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: icon)
                    .foregroundColor(.gray)
            }
        }
        .padding(8)
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.gray, lineWidth: 1)
        }

    }
}

struct LongButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        LongButtonWithIconView(text: "SORT BY", icon: "text.alignleft")
    }
}
