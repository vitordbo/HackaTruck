//
//  Location.swift
//  MapKitApp
//
//  Created by Student on 18/10/23.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}
