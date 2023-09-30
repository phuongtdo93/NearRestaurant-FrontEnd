//
//  MenuScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI

struct MenuScreen: View {
    @State private var choosedItem: String = ""
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
            VStack {
//                Picker("Choose item", selection: $choosedItem) {
//                    ForEach(1...2, id: \.self) { _ in
//                        InfoTag(textStr: "Appetisers")
//                    }
//                }.pickerStyle(.segmented)
                
                ScrollView (.vertical){
                    LazyVGrid(columns: gridItems) {
                        ForEach(1...10, id: \.self) { _ in
                            FoodCellView()
                        }
                    }
                }
            }.padding()
            
                .navigationTitle("Menu")
                
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
