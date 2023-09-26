//
//  SearchScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import SwiftUI


struct SearchScreen: View {
    @State private var selectedPersonNo: String = ""
    var body: some View {
        VStack{
            SearchField()
            Picker("2 person", selection: $selectedPersonNo, content: {
                ForEach(1...4, id: \.self) { _ in
                    Text("Chooos person")
                }
            }).pickerStyle(.menu)
            
            Spacer()
            .navigationTitle("Search")
                
        }
    }
}


struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
