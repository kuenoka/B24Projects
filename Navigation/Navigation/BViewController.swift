//
//  BViewController.swift
//  Navigation
//
//  Created by Oluwafemi Adenaike on 7/8/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func goback(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func goToNews(_ sender: UIButton) {
    navigationController?.popToRootViewController(animated: true)
  }
  
  @IBAction func goToSpecific(_ sender: UIButton) {
    //i want to go to news
    let vcarray = navigationController?.viewControllers
    
    let newsVC = vcarray![0]
    navigationController?.popToViewController(newsVC, animated: true)
  }
  
}
