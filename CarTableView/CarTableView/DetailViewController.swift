//
//  DetailViewController.swift
//  CarTableView
//
//  Created by Oluwafemi Adenaike on 7/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var carLabel: UILabel!
  var carType: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      carLabel.text = carType
    }
    
  
}
