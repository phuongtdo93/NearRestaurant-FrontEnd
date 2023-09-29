//
//  MapScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/29/23.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    let longitude: Double
    let latitude: Double
    let name: String
    @State private var mapRegion: MKCoordinateRegion
    
    private var locations: [RestaurantLocation] = []
    
    init(longitude: Double, latitude: Double, name: String, mapRegion: MKCoordinateRegion) {
        self.longitude = longitude
        self.latitude = latitude
        self.name = name
        self.mapRegion = mapRegion
        //MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        self.locations.append(RestaurantLocation(name: name, coordinate: CLLocationCoordinate2D(latitude: longitude, longitude: latitude)))
        
    }
        
    
    var body: some View {
        
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            MapMarker(coordinate: location.coordinate)
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static let mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    static var previews: some View {
        MapScreen(longitude: 51.5, latitude: -0.12, name: "London", mapRegion: MapScreen_Previews.mapRegion)
    }
}
