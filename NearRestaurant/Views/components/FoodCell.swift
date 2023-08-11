//
//  FoodCell.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct FoodCell: View {
    @State private var isFavorite = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack (alignment: .top){
                Image("image1")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .cornerRadius(10)
                HStack {
                    InfoTag(showStar: true, textStr: "4.0")
                    Spacer()
                    LikeIcon(padding: 5, isFavorite: $isFavorite)
                }.padding(5)
            }
            Text("Vegan chikpar curr kacket potatose")
                .font(.headline)
            Text("Get for cokok this taks getan fytu for an exo tice get dea gaku lu dinner")
                .font(.caption)
                .foregroundColor(.gray)
            HStack {
                Text ("$64")
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.black)
                        .frame(width: 60, height: 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.gray, lineWidth: 1)
                        }
                }

                
            }
        }.padding(5)
    }
}

struct FoodCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodCell()
    }
}
