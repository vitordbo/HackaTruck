//
//  ContentView.swift
//  MapKitApp
//
//  Created by Student on 18/10/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(selectedLocation: Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 52.3555, longitude: 1.1743), flag: "", description: ""))
    }
}
