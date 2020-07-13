//
//  CViewController.swift
//  Navigation
//
//  Created by Oluwafemi Adenaike on 7/8/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
  @IBAction func openD(_ sender: UIButton) {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
