//
//  ViewController.swift
//  LocationApp
//
//  Created by Oluwafemi Adenaike on 7/31/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {

  //var locationManager: CLLocationManager?
  var locManager: LocationManager?
  var currentLocation: CLLocation? /*30.267153 -97.743061    9.0765° 7.3986°*/
  var camera = GMSCameraPosition()
  var mapView = GMSMapView()
  let marker = GMSMarker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
    mapView = GMSMapView(frame: self.view.frame)
    self.view.addSubview(mapView)
    setUpLocationManager()
  }
  
  func createMap () {
    guard let latitude = currentLocation?.coordinate.latitude else { return }
    guard let longitude = currentLocation?.coordinate.longitude else { return }
    camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 6.0)
    mapView.camera = camera

    // Creates a marker in the center of the map.
    marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    marker.title = "Texas"//"Sydney"
    marker.snippet = "America"//"Australia"
    marker.map = mapView
  }
  
  func setUpLocationManager() {
    locManager = LocationManager.shared
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NewLocationReceived), object: nil, queue: .main) { (notif) in
      self.currentLocation = notif.userInfo?["location"] as? CLLocation
      self.createMap ()
      print(notif.userInfo?.values)
    }
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: LocationError), object: nil, queue: .main) { (notif) in
      print(notif.userInfo?.values)
    }
//    locationManager = CLLocationManager()
//    locationManager?.requestAlwaysAuthorization()
//    locationManager?.delegate = self
//    locationManager?.startUpdatingLocation()
  }
//
//  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    print(locations.last)
//  }
//
//  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//    print(error)
//  }
}

