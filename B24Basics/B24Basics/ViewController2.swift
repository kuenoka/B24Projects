//
//  ViewController2.swift
//  B24Basics
//
//  Created by Oluwafemi Adenaike on 7/6/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
  
  deinit {
    print("view controller is deinitialized")
  }

  @IBOutlet weak var mySegOutlet: UISegmentedControl!
  
  @IBAction func mySegmentedControl(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      myLabel.text = "First Segment was selected"
      MyActivityIndicator.stopAnimating()
    case 1:
      myLabel.text = " Second Segment was selected"
      MyActivityIndicator.startAnimating()
    default:
      return
    }
  }
  
  @IBOutlet weak var mySlideOutlet: UISlider!
  @IBAction func mySlider(_ sender: UISlider) {
    myLabel.text = "The slider value \(sender.value) and tracks progress"
    myProgress.progress = sender.value/100
    MyActivityIndicator.stopAnimating()
  }
  
  
  @IBAction func mySwitch(_ sender: UISwitch) {
    if sender.isOn {
      view.backgroundColor = .systemOrange
      MyActivityIndicator.stopAnimating()
    } else {
      view.backgroundColor = .white
      MyActivityIndicator.startAnimating()
    }
  }
  
  @IBOutlet weak var MyActivityIndicator: UIActivityIndicatorView!
  
  
  @IBOutlet weak var myProgress: UIProgressView!
  
  @IBAction func myPageControl(_ sender: UIPageControl) {
    switch sender.currentPage {
    case 0:
      myLabel.text = "This is the first page"
    case 1:
      myLabel.text = "This is the second page"
    case 2:
      myLabel.text = "This is the third page"
    default:
      return
    }
  }
  
  
  @IBOutlet weak var myStepOutlet: UIStepper!
  
  @IBAction func myStepper(_ sender: UIStepper) {
    myLabel.text = "The stepper value \(sender.value)"
    MyActivityIndicator.stopAnimating()
  }
  
  @IBOutlet weak var myLabel: UILabel!
  
  var person = Person.init()
  var address = Address.init()
  var stepperCount = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
      mySegOutlet.setTitle("1stSeg", forSegmentAt: 0)
      mySegOutlet.setTitle("2ndSeg", forSegmentAt: 1)
      mySlideOutlet.maximumValue = 100
      mySlideOutlet.minimumValue = 0
      myStepOutlet.maximumValue = 100
      myStepOutlet.minimumValue = 0
      myStepOutlet.stepValue = 2
      myLabel.text = "First Segment was selected"
      person.address = address
      address.person = person
    }

}

class Person {
  var address: Address?
  deinit {
    print("Person is deinitialized")
  }
}

class Address {
  weak var person: Person?
  deinit {
    print("Address is deninitialized")
  }
}
