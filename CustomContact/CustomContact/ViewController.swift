//
//  ViewController.swift
//  CustomContact
//
//  Created by Oluwafemi Adenaike on 7/27/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var contactTable: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var dataArray = [Person]()
  var searchController: UISearchController!
  var filteredArray = [Person]()
  var shouldShowSearchResult = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    dataArray = CoreDataManager.shared.getContact()
    createBackBarButton()
    createGroupkBarButton()
    createAddNewContact()
    contactTable.dataSource = self
    contactTable.delegate = self
    
    configureSearchController()
  }
  
  func configureSearchController() {
    // Initialize and perform a minimum configuration to the search controller.
    searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    searchController.dimsBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search"
    searchController.searchBar.delegate = self
    searchController.searchBar.sizeToFit()
    
    // Place the search bar view to the tableview headerview.
    contactTable.tableHeaderView = searchController.searchBar
  }
  
  func createAddNewContact() {
    let percentImage = UIImage(systemName: "plus")//?.withTintColor(.blue, renderingMode: .alwaysOriginal)
    let bButton = UIBarButtonItem(image: percentImage, style: .done, target: self, action: #selector(addContact))
    navigationItem.rightBarButtonItem = bButton
  }
  
  @objc func addContact() {
    let st = UIStoryboard(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    vc.delegate = self
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func createBackBarButton() {
    let bButton = UIBarButtonItem.init(title: "Cancel", style: .done, target: self, action: #selector(backButtonAction))
    navigationItem.backBarButtonItem = bButton
  }
  
  @objc func backButtonAction() {
    navigationController?.popViewController(animated: true)
  }
  
  func createGroupkBarButton() {
    let bButton = UIBarButtonItem.init(title: "Groups", style: .done, target: self, action: #selector(groupAction))
    navigationItem.leftBarButtonItem = bButton
  }
  
  @objc func groupAction() {
    
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if shouldShowSearchResult {
      return filteredArray.count
    } else {
      return dataArray.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    if shouldShowSearchResult {
      cell.textLabel?.text = "\(filteredArray[indexPath.row].firstName ?? "") \(filteredArray[indexPath.row].lastName ?? "")"
    } else {
      cell.textLabel?.text = "\(dataArray[indexPath.row].firstName ?? "") \(dataArray[indexPath.row].lastName ?? "")"
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      CoreDataManager.shared.deleteContact(person: dataArray[indexPath.row])
      dataArray.remove(at: indexPath.row)
      tableView.reloadData()
    }
  }
  
}

extension ViewController: UITableViewDelegate, DetailDelegate {
  func reloadTable() {
    dataArray = CoreDataManager.shared.getContact()
    contactTable.reloadData()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let st = UIStoryboard(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    vc.person = dataArray[indexPath.row]
    vc.delegate = self
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension ViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    shouldShowSearchResult = true
    contactTable.reloadData()
  }
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    shouldShowSearchResult = false
    contactTable.reloadData()
  }
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if !shouldShowSearchResult {
      shouldShowSearchResult = true
      contactTable.reloadData()
    }
    
    searchController.searchBar.resignFirstResponder()
  }
}

extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchString = searchController.searchBar.text
    filteredArray = dataArray.filter({ (person) -> Bool in
      let personText: NSString = person.firstName! as NSString
      return (personText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
    })
    contactTable.reloadData()
  }
}
