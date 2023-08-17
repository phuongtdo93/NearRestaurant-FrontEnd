//
//  LikeIconRestaurant.swift
//  NearRestaurant
//
//  Created by Salmdo on 8/11/23.
//

import SwiftUI

struct LikeIconRestaurant: View {
    var showStroke: Bool?
    var padding: CGFloat?
    
    var categoryId: String = ""
    var restaurantId: String = ""
    @State private var isFavorite: Bool = false
    
    
    var body: some View {
        LikeIcon(showStroke: showStroke, padding: padding, isFavorite: $isFavorite)

        
    }
}

struct LikeIconRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        LikeIconRestaurant(categoryId: "", restaurantId: "")
    }
}
