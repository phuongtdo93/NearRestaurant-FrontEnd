//
//  TrendingList.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/4/23.
//

import SwiftUI

struct TrendingList: View {
    @ObservedObject var trendingListVM = TrendingListViewModel()
    
    var body: some View {
        ScrollView (.horizontal) {
            LazyHStack {
                ForEach(trendingListVM.trendingList, id: \.id) { restaurant in
                    TrendingRectangle(restaurantVM: restaurant)
                }
            }.fixedSize()
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
    
}

struct TrendingList_Previews: PreviewProvider {
    static var previews: some View {
        TrendingList()
    }
}
