//
//  Manager.swift
//  WeatherApp
//
//  Created by Adi Gulalkari on 30/08/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate{
            print("Received coordinates: \(coordinate.latitude), \(coordinate.longitude)")
            location = coordinate}
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting while taking locartion", error)
        isLoading = false
    }
}
