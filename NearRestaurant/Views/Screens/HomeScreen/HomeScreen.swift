//
//  NearYouScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/29/23.
//

import SwiftUI
import AppCenterCrashes

struct HomeScreen: View {
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Restaurants")
                            .font(.title)
                            .fontWeight(.bold)
 
                    }
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                
                TrendingListView()
                HorizontalRestaurantListView()
                CategoryListView()
                    
                Spacer()
            }.padding()
            .navigationBarBackButtonHidden(true)
        }
        
        
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
