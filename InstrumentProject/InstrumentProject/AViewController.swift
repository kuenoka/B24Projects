//
//  AViewController.swift
//  InstrumentProject
//
//  Created by Oluwafemi Adenaike on 8/11/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    DispatchQueue.global().async {
      for i in 0..<50000 {
        print(i)
      }
    }
  }
  
  
  @IBAction func openB(_ sender: UIButton) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "BViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
