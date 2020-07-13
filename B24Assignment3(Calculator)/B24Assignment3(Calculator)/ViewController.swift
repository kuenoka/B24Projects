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
  var orrageMathArray = [" + ", " - ", " x ", " / "]
  var currentOAction = ""
  var dotBool = false
  var dotDivider: Double = 10
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    clearOutlet.layer.cornerRadius = 43
    plusMinusOutlet.layer.cornerRadius = 43
    let plusMinusImage = UIImage(systemName: "plusminus")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    plusMinusOutlet.setImage(plusMinusImage, for: .normal)
    percentOutlet.layer.cornerRadius = 43
    let percentImage = UIImage(systemName: "percent")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    percentOutlet.setImage(percentImage, for: .normal)
    divideOutlet.layer.cornerRadius = 43
    let divideImage = UIImage(systemName: "divide")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    divideOutlet.setImage(divideImage, for: .normal)
    multiplyOutlet.layer.cornerRadius = 43
    let multiplyImage = UIImage(systemName: "multiply")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    multiplyOutlet.setImage(multiplyImage, for: .normal)
    subtractOutlet.layer.cornerRadius = 43
    let minusImage = UIImage(systemName: "minus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    subtractOutlet.setImage(minusImage, for: .normal)
    addOutlet.layer.cornerRadius = 43
    let addImage = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    addOutlet.setImage(addImage, for: .normal)
    equalOutlet.layer.cornerRadius = 43
    let equalImage = UIImage(systemName: "equal")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    equalOutlet.setImage(equalImage, for: .normal)
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
    useToCreateNumber (senderTag: sender.tag)
    resultLabel.text = output
  }
  
  func useToCreateNumber (senderTag: Int) {
    let dSenderTag = Double(senderTag)
    if dotBool {
      result = result + (dSenderTag / dotDivider)
      dotDivider *= 10
    } else {
      result = ( result * 10 ) + dSenderTag
    }
    output += "\(senderTag)"
  }
  
  @IBAction func dotAction(_ sender: UIButton) {
    dotBool = true
    dotDivider = 10
    output += "."
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
    dotBool = false
  }
  
  
  @IBAction func orangeBtnsAction(_ sender: UIButton) {
    if sender.tag == 0 {
      equalFunction()
    }
    if sender.tag > 0 {
      useToCreateMath(senderTag: sender.tag)
    }
    dotBool = false
  }
  
  func useToCreateMath(senderTag: Int) {
    if currentOAction != "" || result == 0 {
//      if result == 0  {
        equalFunction()
//      } else if result != 0 {
//        output.removeLast()
//      }
    } else {
      temp = result
    }
    currentOAction = orrageMathArray[senderTag-1]
    result = 0
    output = "\(temp)" + currentOAction
    resultLabel.text = output
  }
  
  func equalFunction() {
    if currentOAction != "" {
      if currentOAction == orrageMathArray[0] {
        temp = temp + result
      }
      if currentOAction == orrageMathArray[1] {
        temp = temp - result
      }
      if currentOAction == orrageMathArray[2] {
        temp = temp * result
      }
      if currentOAction == orrageMathArray[3] {
        temp = temp / result
      }
      currentOAction = ""
      output = "\(temp)"
      result = 0
      resultLabel.text = output
      output = ""
      dotBool = false
    }
  }
  
}

