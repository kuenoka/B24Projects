//
//  ViewController.swift
//  B24Assignment6(CarTableView)
//
//  Created by Oluwafemi Adenaike on 7/15/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

  @IBOutlet weak var tblView: UITableView!
  var carObj = Cars(germanCar: [GermanCar](), americanCar: [AmericanCar]())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    carObj.americanCar = [AmericanCar(carName: "Ford"), AmericanCar(carName: "Buick"), AmericanCar(carName: "Tesla")]
    carObj.germanCar = [GermanCar(carName: "Volkswagen"), GermanCar(carName: "BMW"), GermanCar(carName: "Mercedes-Benz")]
    tblView.dataSource = self
  }
}

extension ViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return "American Cars"
    case 1:
      return "German Cars"
    default:
      return ""
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return carObj.americanCar.count
    case 1:
      return carObj.germanCar.count
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    
    switch indexPath.section {
    case 0:
      cell?.textLabel?.text = carObj.americanCar[indexPath.row].carName
    case 1:
      cell?.textLabel?.text = carObj.germanCar[indexPath.row].carName
    default:
      cell?.textLabel?.text = ""
    }
    
    return cell ?? UITableViewCell()
  }
  
  
}

struct Cars {
  var germanCar: [GermanCar]
  var americanCar: [AmericanCar]
}

struct GermanCar {
  var carName: String
}

struct AmericanCar {
  var carName: String
}
