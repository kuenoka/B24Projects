//
//  ViewController.swift
//  Q_16_Car_with_Alert
//
//  Created by Oluwafemi Adenaike on 7/16/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var mercerdesCars = ["sedan", "SUV"]
  
  var toyotaCars = ["truck", "sedan"]
  
  @IBOutlet weak var tblView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    tblView.delegate = self
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return mercerdesCars.count
    case 1:
      return toyotaCars.count
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    switch indexPath.section {
    case 0:
      cell?.textLabel?.text = mercerdesCars[indexPath.row]
    case 1:
      cell?.textLabel?.text = toyotaCars[indexPath.row]
    default:
      cell?.textLabel?.text = "Nothing"
    }
    return cell ?? UITableViewCell()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return "Mercedes Cars"
    case 1:
      return "Toyota Cars"
    default:
      return "No Cars"
    }
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let st = UIStoryboard(name: "Main", bundle: nil)
//    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//    navigationController?.pushViewController(vc, animated: true)
    switch indexPath.section {
    case 0:
      let alert = UIAlertController(title: "Car", message: "This car is of brand Mercedes and is a \(mercerdesCars[indexPath.row])", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in self.dismiss(animated: true, completion: nil)}))
      alert.addAction(UIAlertAction(title: NSLocalizedString("MoreInfo", comment: "Default action"), style: .default, handler: { _ in
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.carmaker = 0
        vc.carType = indexPath.row
        vc.brand = "Mercedes"
        self.navigationController?.pushViewController(vc, animated: true)

      }))

      present(alert, animated: true, completion: nil)
    case 1:
      let alert = UIAlertController(title: "Car", message: "This car is of brand Toyota and is a \(toyotaCars[indexPath.row])", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in self.dismiss(animated: true, completion: nil)}))
      alert.addAction(UIAlertAction(title: NSLocalizedString("MoreInfo", comment: "Default action"), style: .default, handler: { _ in
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.carmaker = 1
        vc.carType = indexPath.row
        vc.brand = "Toyota"
        self.navigationController?.pushViewController(vc, animated: true)

      }))
      present(alert, animated: true, completion: nil)
    default:
      break
    }
    
  }
}
