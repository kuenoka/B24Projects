//
//  ProfileTableViewCell.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
  
  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var likedByLbl: UILabel!
  @IBOutlet weak var actIndic: UIActivityIndicatorView!
  var post: Post!
  var delegate: CommentDelegate?
  
  @IBAction func likeButton(_ sender: UIButton) {
    guard let postU = post else { return }
    FeedManager.shared.likePost(senderId: postU.senderID, postID: postU.id, likes: postU.likes)
  }
  
  @IBAction func commentButton(_ sender: UIButton) {
    guard let postU = post else { return }
    CommentManager.shared.setID(postID: postU.id)
    delegate?.moveToCommentViewController()
  }
  
  
   func getPost() {
     guard let postU = post else { return }
     actIndic.startAnimating()
     actIndic.isHidden = false
     FeedManager.shared.getPostImage(postId: postU.id, senderId: postU.senderID) { (data) in
       self.postImageView.image = data
       self.actIndic.startAnimating()
       self.actIndic.isHidden = true
     }
   }
}
