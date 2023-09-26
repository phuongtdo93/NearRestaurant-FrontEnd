//
//  SearchField.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/16/23.
//

import SwiftUI


struct SearchField: UIViewRepresentable {
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.placeholder = "Hello"
    }

    func makeUIView(context: Context) -> UISearchBar {
        let uiSearchBar = UISearchBar()
        uiSearchBar.delegate = context.coordinator
        return uiSearchBar
    }
    
    class Coordinator: NSObject,UISearchBarDelegate {
        func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
            return true
        }

        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            print(searchBar.text)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}
