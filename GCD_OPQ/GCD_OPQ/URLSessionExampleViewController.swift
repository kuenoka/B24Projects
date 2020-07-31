//
//  URLSessionExampleViewController.swift
//  GCD_OPQ
//
//  Created by Oluwafemi Adenaike on 7/21/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class URLSessionExampleViewController: UIViewController, APIHandlerDelegate  {
  
  var array = [Info]()
  let apiHandler = APIHandler.init()
  @IBOutlet weak var tblView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    networkSetup1()
    //networkSetup2()
    //networkSetup3()
    apiHandler.apiHandlerDelegate = self
    //networkSetup4()
    tblView.dataSource = self
  }
  
  //ex closure
  func networkSetup1() {
    apiHandler.closureCallBack = { (data, response, error) in
      self.handleResponse(data: data, response: response, error: error)
    }
    apiHandler.getDataFromServer()
  }
  
  //completionhandler ex
  func networkSetup2() {
    apiHandler.getDataFromServer{ (data, response, error) in
      self.handleResponse(data: data, response: response, error: error)
    }
  }
  
  //notif ex
  func networkSetup3() {
    apiHandler.getDataFromServerWithNotif()
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: Notification_DataReceived), object: nil, queue: .main) { (notifObj) in
      let uInfo = notifObj.userInfo
      let d = uInfo?["data"] as? (Data?, URLResponse?, Error?)
      let data = d?.0
      let response = d?.1
      let error = d?.2
      self.handleResponse(data: data, response: response, error: error)
    }
  }
  
  //delegate ex
  func networkSetup4() {
    apiHandler.getDataFromServerWithDelegate()
  }
  
  func sendData(data: Data?, response: URLResponse?, error: Error?) {
    handleResponse(data: data, response: response, error: error)
  }
  
  
  func handleResponse( data: Data?, response: URLResponse?, error: Error?) {
    print("get the response")
    // create model from decoder
    // handle error
    // update UI
    // reload table
    guard let data = data else { return }
    do {
      let info = try JSONDecoder().decode([Info].self, from: data)
      array = info
    } catch {
      print("error")
    }
    tblView.reloadData()
  }
}

extension URLSessionExampleViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    cell?.textLabel?.text = array[indexPath.row].title
    return cell ?? UITableViewCell()
  }
  
}
