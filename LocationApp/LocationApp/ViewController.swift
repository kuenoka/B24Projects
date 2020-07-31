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
  var currentLocation: CLLocation?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //setUpLocationManager()
    setUpLocationManager()
//    createMap ()
    
    let camera = GMSCameraPosition.camera(withLatitude: currentLocation?.coordinate.latitude ??  -33.86, longitude: currentLocation?.coordinate.longitude ?? 151.20, zoom: 6.0)
    let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
    self.view.addSubview(mapView)
    
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: currentLocation?.coordinate.latitude ??  -33.86, longitude: currentLocation?.coordinate.longitude ?? 151.20)
    marker.title = "Texas"//"Sydney"
    marker.snippet = "America"//"Australia"
    marker.map = mapView
  }
  
  func createMap () {
    // Do any additional setup after loading the view.
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    //let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//    let camera = GMSCameraPosition.camera(withLatitude: currentLocation?.coordinate.latitude ??  -33.86, longitude: currentLocation?.coordinate.longitude ?? 151.20, zoom: 6.0)
//    let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
//    self.view.addSubview(mapView)
//
//    // Creates a marker in the center of the map.
//    let marker = GMSMarker()
//    marker.position = CLLocationCoordinate2D(latitude: currentLocation?.coordinate.latitude ??  -33.86, longitude: currentLocation?.coordinate.longitude ?? 151.20)
//    marker.title = "Texas"//"Sydney"
//    marker.snippet = "America"//"Australia"
//    marker.map = mapView
  }
  
  func setUpLocationManager() {
    locManager = LocationManager.shared
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NewLocationReceived), object: nil, queue: .main) { (notif) in
      //self.currentLocation = notif.userInfo?["location"] as? CLLocation
      //self.createMap ()
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

