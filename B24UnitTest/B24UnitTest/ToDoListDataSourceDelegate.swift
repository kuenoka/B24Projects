//
//  ToDoListDataSourceDelegate.swift
//  B24UnitTest
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import UIKit

class ToDoListDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
  
  var items: [ToDoModel] = []
  var delegate: ToDoDelegate?
  lazy var apiHandler: APIHandler = {
    APIHandler(session: URLSession.shared)
  }()
  
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") else { return UITableViewCell()}
    let model = items[indexPath.row]
    cell.textLabel?.text = String(describing: model.id)
    cell.detailTextLabel?.text = model.title
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedModel = items[indexPath.row]
    print(selectedModel.title)
    delegate?.didSelect(index: indexPath.row)
  }
  
  func fetchItems(completion: @escaping () -> Void) {
    apiHandler.fetchToDoItems{ (todos) in
      self.items = todos!
      DispatchQueue.main.async {
        completion()
      }
    }
  }
}

protocol ToDoDelegate {
  func didSelect(index: Int)
}
