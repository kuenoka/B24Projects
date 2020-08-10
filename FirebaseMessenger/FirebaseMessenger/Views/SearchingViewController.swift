//
//  SearchingViewController.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/3/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SearchingViewController: UIViewController {
  
  @IBOutlet weak var tblView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  var userNamesSearch: [User] = []
  var filteredArray: [User] = []
  var shouldShowSearchResult = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    addTitle()
    setup()
    searchBar.delegate = self
  }
  
  
  func addTitle() {
     let title = UILabel()
     title.text = "Find Friends"
     title.textColor = .red
     title.textAlignment = .center
     navigationItem.titleView = title
   }
  
  func setup() {
    SearchManager.shared.getUsers{ (data) in
      self.userNamesSearch = data
      self.tblView.reloadData()
    }
    ContactManager.shared.setID()
    ContactManager.shared.getData{ _ in }
    InvitationManager.shared.setID()
    InvitationManager.shared.getInvites{_ in}
  }

}

extension SearchingViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
    cell.searchLabel?.text = filteredArray[indexPath.row].firstName + " " + filteredArray[indexPath.row].lastName
    cell.friend = filteredArray[indexPath.row]
    return cell
  }
}

extension SearchingViewController: UISearchBarDelegate {
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    shouldShowSearchResult = true
    tblView.reloadData()
  }
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    shouldShowSearchResult = false
    tblView.reloadData()
  }
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if !shouldShowSearchResult {
      shouldShowSearchResult = true
      tblView.reloadData()
    }
    
    self.searchBar.resignFirstResponder()
  }
  
  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    filteredArray = userNamesSearch.filter({
      return (($0.firstName.range(of: text, options: .caseInsensitive)) != nil)
    })
    tblView.reloadData()
    return true
  }
}

