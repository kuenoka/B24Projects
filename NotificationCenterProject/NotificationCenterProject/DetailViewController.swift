//
//  DetailViewController.swift
//  NotificationCenterProject
//
//  Created by Oluwafemi Adenaike on 7/14/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "anotification"), object: nil, userInfo: ["kinfo": "alok"])
  }
  
}
