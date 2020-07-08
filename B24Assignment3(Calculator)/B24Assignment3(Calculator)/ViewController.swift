//
//  ViewController.swift
//  B24Assignment3(Calculator)
//
//  Created by Oluwafemi Adenaike on 7/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var clearOutlet: UIButton!
  @IBOutlet weak var plusMinusOutlet: UIButton!
  @IBOutlet weak var percentOutlet: UIButton!
  @IBOutlet weak var divideOutlet: UIButton!
  @IBOutlet weak var multiplyOutlet: UIButton!
  @IBOutlet weak var subtractOutlet: UIButton!
  @IBOutlet weak var addOutlet: UIButton!
  @IBOutlet weak var equalOutlet: UIButton!
  @IBOutlet weak var dotOutlet: UIButton!
  @IBOutlet weak var zeroOutlet: UIButton!
  @IBOutlet weak var oneOutlet: UIButton!
  @IBOutlet weak var twoOutlet: UIButton!
  @IBOutlet weak var threeOutlet: UIButton!
  @IBOutlet weak var fourOutlet: UIButton!
  @IBOutlet weak var fiveOutlet: UIButton!
  @IBOutlet weak var sixOutlet: UIButton!
  @IBOutlet weak var sevenOutlet: UIButton!
  @IBOutlet weak var eightOutlet: UIButton!
  @IBOutlet weak var nineOutlet: UIButton!
  var result: Double = 0
  var temp: Double = 0
  var output = ""
  var orrageMathArray = ["plus", "minus", "multiply", "divide"]
  var currentOAction = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    clearOutlet.layer.cornerRadius = 43
    plusMinusOutlet.layer.cornerRadius = 43
    percentOutlet.layer.cornerRadius = 43
    divideOutlet.layer.cornerRadius = 43
    multiplyOutlet.layer.cornerRadius = 43
    subtractOutlet.layer.cornerRadius = 43
    addOutlet.layer.cornerRadius = 43
    equalOutlet.layer.cornerRadius = 43
    dotOutlet.layer.cornerRadius = 43
    zeroOutlet.layer.cornerRadius = 43
    oneOutlet.layer.cornerRadius = 43
    twoOutlet.layer.cornerRadius = 43
    threeOutlet.layer.cornerRadius = 43
    fourOutlet.layer.cornerRadius = 43
    fiveOutlet.layer.cornerRadius = 43
    sixOutlet.layer.cornerRadius = 43
    sevenOutlet.layer.cornerRadius = 43
    eightOutlet.layer.cornerRadius = 43
    nineOutlet.layer.cornerRadius = 43
  }

  @IBAction func numbersAction(_ sender: UIButton) {
    if sender.tag == 0 {
      result = ( result * 10 ) + 0
      output += "0"
    }
    if sender.tag == 1 {
      result = ( result * 10 ) + 1
      output += "1"
    }
    if sender.tag == 2 {
      result = ( result * 10 ) + 2
      output += "2"
    }
    if sender.tag == 3 {
      result = ( result * 10 ) + 3
      output += "3"
    }
    if sender.tag == 4 {
      result = ( result * 10 ) + 4
      output += "4"
    }
    if sender.tag == 5 {
      result = ( result * 10 ) + 5
      output += "5"
    }
    if sender.tag == 6 {
      result = ( result * 10 ) + 6
      output += "6"
    }
    if sender.tag == 7 {
      result = ( result * 10 ) + 7
      output += "7"
    }
    if sender.tag == 8 {
      result = ( result * 10 ) + 8
      output += "8"
    }
    if sender.tag == 9 {
     result = ( result * 10 ) + 9
      output += "9"
    }
    resultLabel.text = output
  }
  
  @IBAction func grayButtonsAction(_ sender: UIButton) {
    if sender.tag == 0 {
      result = 0
      temp = 0
      output = ""
      currentOAction = ""
      resultLabel.text = output
    }
    if sender.tag == 1 {
      
    }
    if sender.tag == 2 {
      result = result / 100
      output = "\(result)"
      result = 0
      resultLabel.text = output
    }
  }
  
  
  @IBAction func orangeBtnsAction(_ sender: UIButton) {
    
    if sender.tag == 0 {
      equalFunction()
    }
    
    if sender.tag == 1 {
      if currentOAction != "" {
        equalFunction()
      }
      currentOAction = orrageMathArray[0]
      temp = result
      result = 0
      output += " + "
      resultLabel.text = output
    }
    
    if sender.tag == 2 {
      if currentOAction != "" {
        equalFunction()
      }
      currentOAction = orrageMathArray[1]
      temp = result
      result = 0
      output += " - "
      resultLabel.text = output
    }
    
    if sender.tag == 3 {
      if currentOAction != "" {
        equalFunction()
      }
      currentOAction = orrageMathArray[2]
      temp = result
      result = 0
      output += " x "
      resultLabel.text = output
    }
    
    if sender.tag == 4 {
      if currentOAction != "" {
        equalFunction()
      }
      currentOAction = orrageMathArray[3]
      temp = result
      result = 0
      output += " / "
      resultLabel.text = output
    }
    
  }
  
  func equalFunction() {
    if currentOAction == orrageMathArray[0] {
      result = temp + result
    }
    if currentOAction == orrageMathArray[1] {
      result = temp - result
    }
    if currentOAction == orrageMathArray[2] {
      result = temp * result
    }
    if currentOAction == orrageMathArray[3] {
      result = temp / result
    }
    currentOAction = ""
    output = "\(result)"
    resultLabel.text = output
  }
  
}

