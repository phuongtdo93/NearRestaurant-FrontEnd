//
//  NearYouScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI
import AppCenterCrashes

struct NearYouScreen: View {
    @StateObject private var restaurantListVM = RestaurantListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Restaurants")
                            .font(.title)
                            .fontWeight(.bold)
 
                    }
                    Spacer()
                    UserIcon()
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                
                TrendingList()
                SmallRestaurantListNearYou()
                CategoryList()
                Spacer()
                Button("Click to crash me") {
                    Crashes.generateTestCrash()
                }
            }.padding()
                .environmentObject(restaurantListVM)
            
                .onAppear() {
                    if Crashes.hasCrashedInLastSession {
                        print ("Sorry an error occurs")
                    }
                }
        }
        
    }
}

struct NearYouScreen_Previews: PreviewProvider {
    static var previews: some View {
        NearYouScreen().environmentObject(RestaurantListViewModel())
    }
}
