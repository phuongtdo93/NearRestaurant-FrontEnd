//
//  RestaurantAddress.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/29/23.
//

import MapKit
class RestaurantLocation: NSObject, Identifiable
{
    let id = UUID()
    let name: String?
    let coordinate: CLLocationCoordinate2D
    
    init(name: String?, coordinate:  CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
}
