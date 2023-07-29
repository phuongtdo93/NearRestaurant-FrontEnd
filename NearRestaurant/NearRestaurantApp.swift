//
//  NearRestaurantApp.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/24/23.
//

import SwiftUI
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

@main
struct NearRestaurantApp: App {
    init(){
        AppCenter.start(withAppSecret: "2ef8e666-43f2-4c70-b1ed-6e0fcfdc148e", services:[
          Analytics.self,
          Crashes.self
        ])
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
