//
//  ViewController.swift
//  CarTableView
//
//  Created by Oluwafemi Adenaike on 7/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var carTable: UITableView!
  
  let carDict = ["Sedan": ["Honda", "Toyota", "Civic", "Lexus"], "Hatchback": ["Mazda", "Volkswagon", "Subaru", "Hyunda"]]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    carTable.dataSource = self
    carTable.delegate = self
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    if indexPath.section == 0 {
      cell?.textLabel?.text = carDict["Sedan"]?[indexPath.row]
    } else {
      cell?.textLabel?.text = carDict["Hatchback"]?[indexPath.row]
    }
    return cell ?? UITableViewCell()
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
    lbl.textAlignment = .center
    switch section {
    case 0:
      lbl.text = Array(carDict.keys)[0]
      lbl.backgroundColor = .blue
    case 1:
      lbl.text = Array(carDict.keys)[1]
      lbl.backgroundColor = .red
    default:
      break
    }
    return lbl
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let st = UIStoryboard(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    var key = "Hatchback"
    if indexPath.section == 0 {
      key = "Sedan"
    }
    let value = indexPath.row
    vc.carType = carDict[key]?[value]
    present(vc, animated: true, completion: nil)
  }
}

