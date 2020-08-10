//
//  ViewController.swift
//  B24UnitTest
//
//  Created by Oluwafemi Adenaike on 8/3/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var firstNumber: UITextField!
  @IBOutlet weak var secondNumber: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  let calc = Calculator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    fetchItems()
  }

  @IBAction func addButton(_ sender: UIButton) {
    let num1 = retrieveNum1Int()
    let num2 = retrieveNum2Int()
    let result = calc.add(num1: num1, num2: num2)
    updateResult(value: result)
  }
  
  @IBAction func subtractButton(_ sender: UIButton) {
    let num1 = retrieveNum1Int()
    let num2 = retrieveNum2Int()
    let result = calc.subtract(num1: num1, num2: num2)
    updateResult(value: result)
  }
  
  
  @IBAction func multiplyButton(_ sender: UIButton) {
    let num1 = retrieveNum1Int()
    let num2 = retrieveNum2Int()
    let result = calc.multiply(num1: num1, num2: num2)
    updateResult(value: result)
  }
  
  @IBAction func divideButton(_ sender: UIButton) {
    let num1 = retrieveNum1Int()
    let num2 = retrieveNum2Int()
    let result = calc.divide(num1: num1, num2: num2)
    updateResult(value: result)
  }
  
  func updateResult(value: Int) {
    let strFormatInt = String(describing: value)
    resultLabel.text = strFormatInt
  }
  
  func retrieveNum1Int()-> Int {
    guard let num1S = firstNumber.text, let num1 = Int(num1S) else { return 0 }
    return num1
  }
  
  func retrieveNum2Int()-> Int {
    guard let num2S = secondNumber.text, let num2 = Int(num2S) else { return 0 }
    return num2
  }
  
  func fetchItems() {
    let apiHandler = APIHandler(session: URLSession.shared)
    apiHandler.fetchToDoItems{ _ in }
  }
}

