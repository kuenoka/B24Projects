//
//  ViewController.swift
//  Q_13_SetBackgrounf_Color
//
//  Created by Oluwafemi Adenaike on 7/16/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func changeBackgrounfColor(_ sender: UIButton) {
    if view.backgroundColor == UIColor.green {
      view.backgroundColor = .red
      sender.setTitleColor(.green, for: .normal)
    } else {
      view.backgroundColor = .green
      sender.setTitleColor(.red, for: .normal)
    }
  }
  
}

