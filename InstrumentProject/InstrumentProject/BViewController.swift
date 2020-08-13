//
//  BViewController.swift
//  InstrumentProject
//
//  Created by Oluwafemi Adenaike on 8/11/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
  
  var john: Person?
  var unit4A: Apartment?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    john = Person(name: "John Appleseed")
    unit4A = Apartment(unit: "4A")
    john!.apartment = unit4A
    unit4A!.tenant = john
  }
  
  deinit {
    print("About to be Initialize")
  }
  
}

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}


