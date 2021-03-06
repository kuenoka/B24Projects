//
//  ViewController.swift
//  TableView
//
//  Created by Oluwafemi Adenaike on 7/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomeCellTableViewProtocol, UISearchBarDelegate {
  
  @IBOutlet weak var serachBar: UISearchBar!
  var array = ["lokesh", "amit", "alok"]
  var isSearch = false
  var filterArray = [String]()
  
  func setUpSearchbar() {
    serachBar.delegate = self
    //filterArray = array
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    serachBar.resignFirstResponder()
    isSearch = false
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    isSearch = true
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    isSearch = true
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    serachBar.resignFirstResponder()
  }
  
  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    filterArray = array.filter({
//      return $0.lowercased().contains(text.lowercased())
      return (($0.range(of: text, options: .caseInsensitive)) != nil)
    })
    tblView.reloadData()
    return true
  }
  
  func btnTapped() {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    vc.infoToBeReceived = "\(infoToBePassed)"
    present(vc, animated: true, completion: nil)
  }
  
  @IBOutlet weak var tblViewTwo: UITableView!
  var dataSource = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
  
   @IBOutlet weak var tblView: UITableView!
  var infoToBePassed = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    tblView.delegate = self
    tblViewTwo.delegate = self
    tblViewTwo.dataSource = self
    setUpSearchbar()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    var number = 0
//    if tableView == tblView {
//      number = 10
//    } else if tableView == tblViewTwo {
//      number = dataSource.count
//    }
//    return number
    if isSearch {
      return array.count
    } else {
      return filterArray.count
    }
  }
  
//  func numberOfSections(in tableView: UITableView) -> Int {
//    var number = 0
//    if tableView == tblView {
//      number =  2
//    } else if tableView == tblViewTwo {
//      number = 1
//    }
//    return number
//  }
  
  @objc func btnClickedAction() {
    //let infoToBePassed = indexPath.row
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    vc.infoToBeReceived = "\(infoToBePassed)"
    present(vc, animated: true, completion: nil)
  }
//
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    var cellToReturn = UITableViewCell()
//    if tableView == tblView {
//      let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellTableViewCell
//      //infoToBePassed = indexPath.row
//      cell.delegate = self
//      cell.closure = { tag in
//          print(tag)
//        self.btnClickedAction()
//          if 1==1 {
//              return true
//          }else {
//              return false
//          }
//      }
//      cell.btnClk.tag = indexPath.row
//  //    cell.btnClk.removeTarget(self, action: #selector(btnClickedAction), for: .touchUpInside)
//  //    cell.btnClk.addTarget(self, action: #selector(btnClickedAction), for: .touchUpInside)
//      cell.textLabel?.text = "\(indexPath.row)" //string interpolation
//      cell.backgroundColor = .green
//      if indexPath.row % 2 == 0 {
//        cell.backgroundColor = .red
//      }
//
//      if indexPath.section == 1 {
//        cell.textLabel?.text = "2nd Section, Row:\(indexPath.row)"
//      }
//      cellToReturn = cell
//    } else  if tableView == tblViewTwo {
//      let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//      cell?.textLabel?.text = dataSource[indexPath.row]
//      cell?.backgroundColor = .blue
//      cellToReturn = cell ?? UITableViewCell()
//    }
//    return cellToReturn
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellTableViewCell
    var text = ""
    if isSearch {
      text = array[indexPath.row]
    } else {
      text = filterArray[indexPath.row]
    }
    cell.textLabel?.text = text
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let infoToBePassed = indexPath.row
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    vc.infoToBeReceived = "\(infoToBePassed)"
    present(vc, animated: true, completion: nil)
  }
  
//  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    return "Section " + "\(section)"
//  }
  
//  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//    var number: CGFloat = 0
//    if tableView == tblView {
//      number = 80
//    }
//    return number
//  }
  
//  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    if tableView == tblView {
//      let lbl = UILabel.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
//      lbl.textAlignment = .center
//      if section == 0 {
//        lbl.backgroundColor = .blue
//      } else {
//        lbl.backgroundColor = .yellow
//      }
//      lbl.text = "Section " + "\(section)"
//      return lbl
//    } else {
//      return UIView()
//    }
//  }
}

