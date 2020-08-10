//
//  SearchTableViewCell.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchTableViewCell: UITableViewCell {
  
  @IBOutlet weak var searchLabel: UILabel!
  var friend: User!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  
  @IBAction func addContact(_ sender: UIButton) {
    SearchManager.shared.addNewContact(friend: friend)
    SearchManager.shared.sendInvite(friend: friend)
    SearchManager.shared.removeInvite(friend: friend)
  }
  
}
