//
//  MapScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/29/23.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    let location: Location
    @State private var mapRegion: MKCoordinateRegion
    
    
    init(location: Location, mapRegion: MKCoordinateRegion) {
        self.location = location
        self.mapRegion = mapRegion
        //MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
        
    
    var body: some View {
        
        Map(coordinateRegion: $mapRegion, annotationItems: [location]) { location in
            MapMarker(coordinate: location.coordinate!)
            
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static let mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    static var previews: some View {
        MapScreen(location: Location(name: "No name", latitude: 51.5, longitude: -0.12, fullAddress:  ""), mapRegion: MapScreen_Previews.mapRegion)
    }
}
