//
//  ToDoListViewController.swift
//  B24UnitTest
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, ToDoDelegate {
  
  @IBOutlet weak var toDoTableView: UITableView!
  var items: [ToDoModel] = []
  var dsDelegate: ToDoListDataSourceDelegate!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setup()
    dsDelegate.delegate = self
  }
  
  func setup() {
    dsDelegate = ToDoListDataSourceDelegate()
    toDoTableView.dataSource = dsDelegate
    toDoTableView.delegate = dsDelegate
    dsDelegate.fetchItems {
      DispatchQueue.main.async {
        self.toDoTableView.reloadData()
      }
    }
  }
  
  func didSelect(index: Int) {
    print("success")
  }
}

