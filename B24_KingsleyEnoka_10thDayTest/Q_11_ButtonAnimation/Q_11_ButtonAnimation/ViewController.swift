//
//  ViewController.swift
//  Q_11_ButtonAnimation
//
//  Created by Oluwafemi Adenaike on 7/16/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var widthContraint: NSLayoutConstraint!
  
  @IBOutlet weak var heightConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func btnAction(_ sender: UIButton) {
    UIView.animate(withDuration: 0.5) {
      if self.widthContraint.constant == 100 {
        self.widthContraint.constant = 150
        self.heightConstraint.constant = 150
      } else {
        self.widthContraint.constant = 100
        self.heightConstraint.constant = 100
      }
      self.view.layoutIfNeeded()
    }
  }
  
}

