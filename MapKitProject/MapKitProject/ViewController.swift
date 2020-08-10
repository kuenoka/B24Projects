//
//  ViewController.swift
//  MapKitProject
//
//  Created by Oluwafemi Adenaike on 8/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let location = CLLocationCoordinate2D(latitude: 51.50007773,
        longitude: -0.1246402)
    
    // 2
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
    //3
    let annotation = MKPointAnnotation()
    annotation.coordinate = location
    annotation.title = "Big Ben"
    annotation.subtitle = "London"
    mapView.addAnnotation(annotation)
  }


}

