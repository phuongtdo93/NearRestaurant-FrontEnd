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
        AppCenter.start(withAppSecret: "0581a447-cccd-44e8-86ad-39cb85ef5ccc", services:[
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
