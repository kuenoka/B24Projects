//
//  ViewController.swift
//  Autolayout
//
//  Created by Oluwafemi Adenaike on 7/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var yConstraintBtnTop: NSLayoutConstraint!
  
  @IBOutlet weak var testView: TestView!
  
  @IBAction func myButton(_ sender: UIButton) {
    UIView.animate(withDuration: 0.5) {
      self.yConstraintBtnTop.constant += 10
      self.view.layoutIfNeeded()
    }
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
//    let v = TestView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//    view.addSubview(v)
    print(yConstraintBtnTop.constant)
    testView.mainLabel.text = "sup sup sup"
  }

//  override func viewDidLayoutSubviews() {
//    <#code#>
//  }
}

