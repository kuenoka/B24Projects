//
//  FeedManager.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class FeedManager {
  static let shared = FeedManager()
  private var postRef = Database.database().reference().child("posts")
  private var postStoreRef = Storage.storage().reference().child("postImages")
  private var followRef = Database.database().reference().child("following")
  private var posts: [Post] = []
  private var followings: [Following] = []
  
  func getFollowing() {
    followRef.observe(.value) { (snapshot) in
      let postDic = snapshot.value as? [String : [String: String] ] ?? [:]
      for following in postDic.values {
        if let username = following["username"], let id = following["id"] {
          self.followings.append(Following(username: username , id: id))
        }
      }
    }
  }
  
  func getPosts(completion: @escaping ([Post])-> Void) {
    postRef.observe(.value) { (snapshot) in
      let postDic = snapshot.value as? [String : [String : AnyObject ] ] ?? [:]
      self.posts = []
      for myValues in postDic {
        let canFeed = self.canGetFeed(key: myValues.key)
        if canFeed.0 {
          self.arrangeData(postDict: myValues.value)
        }
      }
      DispatchQueue.main.async {
        completion(self.posts)
      }
    }
  }
  
  private func canGetFeed(key: String) -> (Bool, String) {
    var canFeed = false
    var id = ""
    for following in followings {
      if key == following.id {
        canFeed = true
        id = key
      }
    }
    return (canFeed, id)
  }
  
  private func arrangeData(postDict: [String : AnyObject]) {
    for post in postDict.values {
      if let likes = post["likes"], let date = post["date"], let id = post["id"] {
        posts.append(Post(likes: likes as! Int, date: date as! String, id: id as! String))
      }
    }
  }
  
  func getPostImage(id: String, completion: @escaping (UIImage?) -> Void ) {
    postStoreRef.child(id).getData(maxSize: 20 * 1024 * 1024) { data, error in
      guard let data = data else { return }
      if let error = error {
        print(error.localizedDescription)
      } else {
        let image = UIImage(data: data)
        DispatchQueue.main.async {
          completion(image)
        }
      }
    }
  }
  
  private init() {}
}
