//
//  CustomImage.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomImage: View {
    var urlString: String
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View  {
        
        WebImage(url: URL(string: urlString))
            .resizable()
            .placeholder(Image(systemName: "photo")) // Placeholder Image
            .placeholder {
                Rectangle().foregroundColor(.gray)
            }
            .scaledToFill()
            .frame(width: width ?? UIScreen.main.bounds.width, height: height ?? UIScreen.main.bounds.height)
            .cornerRadius(10)
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(urlString: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/application-1688213434869-d9e3e4ed414dimage")
    }
}
