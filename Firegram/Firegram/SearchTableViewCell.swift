//
//  SearchTableViewCell.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
  
  @IBOutlet weak var usernameTF: UILabel!
  var profile: Profile!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  @IBAction func followAction(_ sender: UIButton) {
    SearchManager.shared.followProfile(profile: profile)
  }
  
  
}
