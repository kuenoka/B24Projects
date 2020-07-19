//
//  ViewController.swift
//  Q_12_Navigation
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


  @IBAction func presentAVC(_ sender: UIButton) {
    let st = UIStoryboard(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "AViewController")
    present(vc, animated: true, completion: nil)
  }
  
  
  @IBAction func pushBVC(_ sender: UIButton) {
    let st = UIStoryboard(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "BViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
}

