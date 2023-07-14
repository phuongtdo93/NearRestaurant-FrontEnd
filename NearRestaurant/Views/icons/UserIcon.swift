//
//  UserIcon.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/28/23.
//

import SwiftUI

struct UserIcon: View {
    var body: some View {
        Image("image1")
            .resizable()
            .scaledToFill()
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            
    }
}

struct UserIcon_Previews: PreviewProvider {
    static var previews: some View {
        UserIcon()
    }
}
