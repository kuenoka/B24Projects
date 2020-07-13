//
//  SettingsViewController.swift
//  Navigation
//
//  Created by Oluwafemi Adenaike on 7/8/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .purple
        // Do any additional setup after loading the view.
    }
    
  
  @IBAction func openC(_ sender: UIButton) {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "CViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
