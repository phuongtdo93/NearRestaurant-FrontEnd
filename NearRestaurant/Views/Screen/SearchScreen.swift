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
        NavigationView {
            Picker("2 person", selection: $selectedPersonNo, content: {
                ForEach(1...4, id: \.self) { _ in
                    Text("Chooos person")
                }
            }).pickerStyle(.menu)
                .navigationTitle("Search")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        BackButton()
                    }
                }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
