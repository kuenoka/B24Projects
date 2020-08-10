//
//  FeedTableViewCell.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var postImageView: UIImageView!
  var post: Post!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  
  @IBAction func likeButton(_ sender: UIButton) {
    
  }
  
  func getPost() {
    guard let postU = post else { return }
    PostManager.shared.getPostImage(id: postU.id) { (data) in
      self.postImageView.image = data
    }
  }
  
}
