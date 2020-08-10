//
//  ProfileCollectionViewCell.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var postImageView: UIImageView!
  
  var post: Post!
  
  func getPost() {
    guard let postU = post else { return }
    PostManager.shared.getPostImage(id: postU.id) { (data) in
      self.postImageView.image = data
    }
  }
}
