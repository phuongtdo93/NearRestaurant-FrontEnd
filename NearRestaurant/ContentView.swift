//
//  ContentView.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            HomeScreen()
//            LoginScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
