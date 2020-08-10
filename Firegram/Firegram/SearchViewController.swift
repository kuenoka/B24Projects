//
//  SearchViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/9/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tblView: UITableView!
  
  var profileArray: [Profile] = []
  var filteredArray: [Profile] = []
  var shouldShowSearchResult = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    searchBar.delegate = self
    addSearchTitle()
    setUp()
  }
  
  func addSearchTitle() {
    let title = UILabel()
    title.text = "Find Friend"
    title.textColor = .black
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  func setUp() {
    SearchManager.shared.getProfiles { (data) in
      self.profileArray = data
      self.tblView.reloadData()
    }
  }
}

extension SearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
    cell.usernameTF.text = filteredArray[indexPath.row].username
    cell.profile = filteredArray[indexPath.row]
    return cell
  }
  
}

extension SearchViewController: UISearchBarDelegate {
  
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
    filteredArray = profileArray.filter({
      return (($0.username.range(of: text, options: .caseInsensitive)) != nil)
    })
    tblView.reloadData()
    return true
  }
}


