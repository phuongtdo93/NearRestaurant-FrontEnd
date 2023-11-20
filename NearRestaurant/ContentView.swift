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
            LoginScreen()
//            SignUpScreen()
//            HomeScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
