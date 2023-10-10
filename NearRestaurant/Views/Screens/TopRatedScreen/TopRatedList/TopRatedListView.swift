//
//  TopRatedList.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import SwiftUI

struct TopRatedListView: View {
    @ObservedObject var topRatedListVM = TopRatedListViewModel(restaurantService: RestaurantService.instance)
    var body: some View {
        VStack {
            HStack {
                Text("Top Rated")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            
            ScrollView {
                ForEach(topRatedListVM.topRatedListVM, id: \.id) { restaurant in
                    RestaurantItemView(restaurantVM: restaurant)
                }
            }
        }
        
        .onAppear(){
            topRatedListVM.fetchTop5Restaurant()
        }
    }
}

struct TopRatedList_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedListView()
    }
}
