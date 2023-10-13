//
//  Categories.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI

struct CategoryView: View {
    let name: String
    let categoryId: String
    
    var body: some View {
        NavigationLink {
            RestaurantListScreen(categoryId: categoryId)
        } label: {
            HStack {
                Text(name).foregroundColor(.black)
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(Color(hex: CustomColor.gray1))
                    .padding(2)
                    .background(.black)
                    .cornerRadius(100)
                    .overlay {
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(lineWidth: 1)
                    }
            }
            .padding(10)
            .background(Color(hex: CustomColor.gray1))
            .cornerRadius(10)
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(name: "Italian", categoryId: "64ad211acde3b553079129f1")
    }
}
