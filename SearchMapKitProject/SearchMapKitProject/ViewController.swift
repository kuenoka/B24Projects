//
//  ViewController.swift
//  SearchMapKitProject
//
//  Created by Oluwafemi Adenaike on 8/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
  
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  let initialLocation = CLLocation(latitude: 52.3740300, longitude: 4.8896900)
  let searchRadius: CLLocationDistance = 2000
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    mapView.delegate = self
    searchInMap()
    
    let coordinateRegion = MKCoordinateRegion.init(center: initialLocation.coordinate, latitudinalMeters: searchRadius * 2.0, longitudinalMeters: searchRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  @IBAction func searchOnValueChange(_ sender: Any) {
    mapView.removeAnnotations(mapView.annotations)
    searchInMap()
  }
  
  func searchInMap() {
    // 1
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)
    // 2
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    request.region = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
    // 3
    let search = MKLocalSearch(request: request)
    search.start(completionHandler: {(response, error) in
            
        for item in response!.mapItems {
            self.addPinToMapView(title: item.name, latitude: item.placemark.location!.coordinate.latitude, longitude: item.placemark.location!.coordinate.longitude)
        }
    })
  }
  
  func addPinToMapView(title: String?, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
    if let title = title {
      let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      let annotation = MKPointAnnotation()
      annotation.coordinate = location
      annotation.title = title
      
      mapView.addAnnotation(annotation)
    }
  }
}

