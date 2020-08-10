//
//  ViewController.swift
//  MVVM_Project
//
//  Created by Oluwafemi Adenaike on 8/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tblView: UITableView!
  let vm = ViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    vm.getData(urlString: "https://jsonplaceholder.typicode.com/todos/")
    tblView.dataSource = self
    vm.closure = {
      let str = self.vm.errorString
      if str.count > 0 {
        //alert here
      } else {
        self.tblView.reloadData()
      }
    }
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    vm.getRows()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    let model = vm.getObject(index: indexPath.row)
    cell?.textLabel?.text = model.title
    return cell!
  }
  
  
}
