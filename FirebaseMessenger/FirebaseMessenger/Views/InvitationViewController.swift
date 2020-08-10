//
//  InvitationViewController.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/6/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class InvitationViewController: UIViewController {
  
  @IBOutlet weak var tblView: UITableView!
  var invites: [Invite] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    addTitle()
    InvitationManager.shared.setID()
    setup()
    }
  
  func addTitle() {
    let title = UILabel()
    title.text = "Invites"
    title.textColor = .red
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  func setup() {
    InvitationManager.shared.getInvites{ (data) in
      self.invites = data
      self.tblView.reloadData()
    }
  }
  
}

extension InvitationViewController: UITableViewDataSource, InviteRemove {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return invites.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! InviteTableViewCell
    cell.inviteLabel.text = invites[indexPath.row].friendFirstName + " " + invites[indexPath.row].friendLastName
    cell.friend = invites[indexPath.row]
    cell.delegate = self
    return cell
  }
  
  func reload() {
    DispatchQueue.main.async {
      self.tblView.reloadData()
    }
  }
}
