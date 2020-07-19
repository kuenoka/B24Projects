//
//  ViewController.swift
//  NotificationCenterProject
//
//  Created by Oluwafemi Adenaike on 7/14/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
  @IBOutlet weak var tblView: UITableView!
  var myPlist = [String]()
  
  @objc func receivedNotif(i:Notification) {
    print("received")
    print(i.userInfo?["kinfo"])
  }
  
  @objc func refresh_News_Or_Stocks_Or_Feed_UserJustEnteredForeground() {
    print("received")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    NotificationCenter.default.addObserver(self, selector: #selector(receivedNotif), name: NSNotification.Name("anotification"), object: nil)
    
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "anotification"), object: nil, queue: nil) { (i) in
      print(i.userInfo?["kinfo"])
    }
    
    NotificationCenter.default.addObserver(self, selector: #selector(refresh_News_Or_Stocks_Or_Feed_UserJustEnteredForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    
    tblView.dataSource = self
    tblView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let p = Bundle.main.path(forResource: "some", ofType: "plist", inDirectory: nil) else { return }
    
    let res = NSDictionary.init(contentsOfFile: p)
    print(res)
    
    
    let url = Bundle.main.url(forResource: "some1", withExtension: "plist")!
    let soundsData = try! Data(contentsOf: url)
    
    do {
     let res = try? PropertyListSerialization.propertyList(from: soundsData, options: [], format: nil)
      
      if let mp = res {
        let plist = mp as? [String]
        myPlist = plist ?? [String]()
        print(myPlist)
      }

    } catch {
      print(error)
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return myPlist.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    guard let cel = cell else { return UITableViewCell() }
    cel.textLabel?.text = myPlist[indexPath.row]
    return cel
  }
  

}

