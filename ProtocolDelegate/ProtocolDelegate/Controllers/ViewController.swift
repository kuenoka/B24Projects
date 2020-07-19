//
//  ViewController.swift
//  ProtocolDelegate
//
//  Created by Oluwafemi Adenaike on 7/17/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DetailViewControllerProtocol {
  
  @IBOutlet weak var tblView: UITableView!
  var array: [String] = []
  
  func addEntry(entry: String) {
    //have the data and add it to your global array
    array.append(entry)
  }
  
  func reloadTableView() {
    //self.tblObj.reloadData
    tblView.reloadData()
  }
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    showDefaultErrorAlert()
  }

  @IBAction func openDVC(_ sender: UIButton) {
    let st = UIStoryboard(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    vc.detailViewControllerProtocol = self
    navigationController?.pushViewController(vc, animated: true)
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    cell?.textLabel?.text = array[indexPath.row]
    return cell ?? UITableViewCell()
  }
  
  
}

