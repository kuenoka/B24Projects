//
//  DetailViewController.swift
//  TableView
//
//  Created by Oluwafemi Adenaike on 7/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

  @IBOutlet weak var lblDetail: UILabel!
  
  @IBOutlet weak var dtblView: UITableView!
  
  var dataSource = ["alok", "amit", "lokesh"]
  
  var infoToBeReceived: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      lblDetail.text = infoToBeReceived
      dtblView.dataSource = self
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    cell?.textLabel?.text = dataSource[indexPath.row]
    return cell ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    if indexPath.row == 0 {
      return false
    }
    return true
  }
  
  //implementing delete rows
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      dataSource.remove(at: indexPath.row)
      tableView.reloadData()
    }
  }
}
