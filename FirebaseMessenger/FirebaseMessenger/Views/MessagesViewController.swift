//
//  MessagesViewController.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/6/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {
  
  var friend: Contact!
  @IBOutlet weak var tblView: UITableView!
  @IBOutlet weak var msgTextField: UITextField!
  var messageArray: [Message] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    MessageManager.shared.setID(id: friend.messageID)
    setup()
  }
  
  @IBAction func sendMessage(_ sender: UIButton) {
    let sender = ProfileManager.shared.getUser()
    let senderName = sender.firstName + " " + sender.lastName
    let iD = messageArray.count + 1
    if let msg = msgTextField.text {
      MessageManager.shared.postMessage(message: Message(sender: senderName, message: msg, id: iD, date: ""))
    }
    msgTextField.text = nil
  }
  
  func setup() {
    MessageManager.shared.getData{ (data) in
      self.messageArray = data
      self.tblView.reloadData()
    }
  }
  
}

extension MessagesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    messageArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.text = messageArray[indexPath.row].message
    cell.detailTextLabel?.text = messageArray[indexPath.row].sender + " " + messageArray[indexPath.row].date
    return cell
  }
}
