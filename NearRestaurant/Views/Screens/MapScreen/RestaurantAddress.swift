//
//  RestaurantAddress.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/29/23.
//

import MapKit
class Location: NSObject, Identifiable
{
    let id = UUID()
    let name: String?
    let longitude: Double?
    let latitude: Double?
    let fullAddress: String?
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude, let longitude else { return nil }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(name: String?, latitude: Double?, longitude: Double?, fullAddress: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.fullAddress = fullAddress
    }
}
