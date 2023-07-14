//
//  TabButton.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct TabButton: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("List")
            }
            
            Button {
                
            } label: {
                Text("Map")
            }

        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton()
    }
}
