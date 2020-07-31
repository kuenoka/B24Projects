//
//  LocationManager.swift
//  LocationApp
//
//  Created by Oluwafemi Adenaike on 7/31/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
  
  static let shared = LocationManager()
  private var locationManager: CLLocationManager?
  
  private override init() {
    super.init()
    setUpLocationManager()
  }
  
  func setUpLocationManager() {
    locationManager = CLLocationManager()
    locationManager?.requestAlwaysAuthorization()
    locationManager?.delegate = self
    locationManager?.startUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: NewLocationReceived), object: nil, userInfo: ["location": locations.last])
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
     NotificationCenter.default.post(name: NSNotification.Name(rawValue: LocationError), object: nil, userInfo: ["error": error])
  }
}
