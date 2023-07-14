//
//  TableCell.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/25/23.
//

import SwiftUI

struct TableCell: View {
    var title: String
    
    var body: some View {
        NavigationLink {
            MenuScreen()
        } label: {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
    //            Text("12")
                Image(systemName: "chevron.forward")

            }
            .frame(width: .infinity, height: 30)

            .padding(10)
            .background(Color(hex: CustomColor.gray1))
            .cornerRadius(10)
        }

        

    }
}

struct TableCell_Previews: PreviewProvider {
    static var previews: some View {
        TableCell(title: "Menu")
    }
}
