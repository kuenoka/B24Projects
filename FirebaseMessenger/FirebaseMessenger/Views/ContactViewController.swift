//
//  ContactViewController.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/3/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ContactViewController: UIViewController {
  
  @IBOutlet weak var tblView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  var contactArray: [Contact] = []
  var filteredArray: [Contact] = []
  var shouldShowSearchResult = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addTitle()
    tblView.dataSource = self
    tblView.delegate = self
    ContactManager.shared.setID()
    setup()
    searchBar.delegate = self
  }
  
  func addTitle() {
    let title = UILabel()
    title.text = "Contact"
    title.textColor = .red
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  func setup() {
    ContactManager.shared.getData { (data) in
      self.contactArray = data
      self.tblView.reloadData()
    }
  }
  
}

extension ContactViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if shouldShowSearchResult {
      return filteredArray.count
    } else {
      return contactArray.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    if shouldShowSearchResult {
      cell.textLabel?.text = filteredArray[indexPath.row].friendFirstName + " " + filteredArray[indexPath.row].friendLastName
    } else {
      cell.textLabel?.text = contactArray[indexPath.row].friendFirstName + " " + contactArray[indexPath.row].friendLastName
    }
    return cell
  }
  
  
}

extension ContactViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "MessagesViewController") as MessagesViewController
    if shouldShowSearchResult {
      vc.friend = filteredArray[indexPath.row]
    } else {
      vc.friend = contactArray[indexPath.row]
    }
    
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension ContactViewController: UISearchBarDelegate {
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    shouldShowSearchResult = true
    tblView.reloadData()
  }
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    shouldShowSearchResult = false
    tblView.reloadData()
  }
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    shouldShowSearchResult = false
    tblView.reloadData()
    self.searchBar.resignFirstResponder()
  }
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if !shouldShowSearchResult {
      shouldShowSearchResult = true
      tblView.reloadData()
    }
    
    self.searchBar.resignFirstResponder()
  }
  
  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    filteredArray = contactArray.filter({
      return (($0.friendFirstName.range(of: text, options: .caseInsensitive)) != nil)
    })
    tblView.reloadData()
    return true
  }
}

