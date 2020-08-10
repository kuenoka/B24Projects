//
//  InviteTableViewCell.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/6/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class InviteTableViewCell: UITableViewCell {
  
  @IBOutlet weak var inviteLabel: UILabel!
  var friend: Invite!
  var delegate: InviteRemove!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  @IBAction func acceptInvite(_ sender: UIButton) {
    InvitationManager.shared.addNewContact(friend:friend)
    InvitationManager.shared.removeInvite(friend: friend)
    delegate.reload()
  }
  
}

protocol InviteRemove {
  func reload()
}
