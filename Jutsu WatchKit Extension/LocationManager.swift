//
//  LocationManager.swift
//  Jutsu WatchKit Extension
//
//  Created by Vincent Nguyen on 10/9/21.
//
import MapKit
import CoreLocation
import SwiftUI

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let manager = CLLocationManager()
    
    override init() {
            super.init()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyReduced
        manager.allowsBackgroundLocationUpdates = true

          //  manager.requestWhenInUseAuthorization()
          //  manager.startUpdatingLocation()
        }
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            locations.last.map {
//                region = MKCoordinateRegion(
//                    center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
//                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//                )
//            }
//        }
    

}
