//
//  DetailViewController.swift
//  Q_16_Car_with_Alert
//
//  Created by Oluwafemi Adenaike on 7/16/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var brand: String!
  var carmaker: Int!
  var carType: Int!
  var arrayCars = [[UIImage(named: "MercedesSedan"), UIImage(named: "MercedesSUV")], [UIImage(named: "ToyotaTruck"), UIImage(named: "ToyotaSedan")]]
  
  @IBOutlet weak var carBrand: UILabel!
  @IBOutlet weak var carImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    carBrand.text = brand
    carImageView.image = arrayCars[carmaker][carType]
    let string = "he"
    print(String((Array(string))[0]))
  }
  
  
}
