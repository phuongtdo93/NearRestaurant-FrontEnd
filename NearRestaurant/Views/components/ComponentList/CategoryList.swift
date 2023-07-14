//
//  CategoryList.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/1/23.
//

import SwiftUI

struct CategoryList: View {
    let gridItem = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var categoryListViewModel = CategoryListViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.title2)
            .fontWeight(.bold)
            
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItem) {
                    ForEach(categoryListViewModel.categoryList, id:\.id) { item in
                        Categories(text: item.name)
                    }
                }
            }
        }
        
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
