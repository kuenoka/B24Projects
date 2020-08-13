//
//  FeedTableViewCell.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var likesLbl: UILabel!
  @IBOutlet weak var postImageView: UIImageView!
  var post: Post!
  var delegate: CommentDelegate?
  
  @IBAction func likeButton(_ sender: UIButton) {
    guard let postU = post else { return }
    FeedManager.shared.likePost(senderId: postU.senderID, postID: postU.id, likes: postU.likes)
  }
  
  
  @IBAction func commentAction(_ sender: UIButton) {
    guard let postU = post else { return }
    CommentManager.shared.setID(postID: postU.id)
    delegate?.moveToCommentViewController()
  }
  
  @IBOutlet weak var actIndic: UIActivityIndicatorView!
  
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

protocol CommentDelegate {
  func moveToCommentViewController()
}
