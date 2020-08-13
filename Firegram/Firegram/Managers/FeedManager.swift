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
  private var followRef: DatabaseReference!
  private var senderID: String!
  private var posts: [Post] = []
  private var followings: [Following] = []
  
  func setID(id: String) {
    senderID = id
    followRef = Database.database().reference().child("following").child(id)
  }
  
  func getFollowing() {
    followRef.observe(.value) { (snapshot) in
      let postDic = snapshot.value as? [String : [String: String] ] ?? [:]
      self.followings = []
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
      self.posts = PostManager.shared.getMyPosts()
      //self.posts = []
      for myValues in postDic {
        let canFeed = self.canGetFeed(key: myValues.key)
        if canFeed {
          self.arrangeData(postDict: myValues.value)
        }
      }
      let df = DateFormatter()
      df.dateFormat = "MMM d, h:mm a"
      self.posts.sort(by: {df.date(from: $0.date)! > df.date(from: $1.date)!})
      DispatchQueue.main.async {
        completion(self.posts)
      }
    }
  }
  
  private func canGetFeed(key: String) -> Bool {
    var canFeed = false
    for following in followings {
      if key == following.id {
        canFeed = true
      }
    }
    return canFeed
  }
  
  private func arrangeData(postDict: [String : AnyObject]) {
    for post in postDict.values {
      if let likes = post["likes"], let date = post["date"], let id = post["id"], let senderId = post["senderID"] {
        posts.append(Post(likes: likes as! Int, date: date as! String, id: id as! String, senderID: senderId as! String))
      }
    }
  }
  
  func getPostImage(postId: String, senderId: String, completion: @escaping (UIImage?) -> Void ) {
    postStoreRef.child(senderId).child(postId).getData(maxSize: 20 * 1024 * 1024) { data, error in
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
  
  func likePost(senderId: String, postID: String, likes: Int) {
    let numberOfLikes = likes + 1
    let ref = Database.database().reference()
    ref.child("posts/\(senderId)/\(postID)/likes").setValue(numberOfLikes)
    let profileUsername = ProfileManager.shared.getMyProfile().username
    ref.child("likes").child(postID).child(senderId).setValue(["username": profileUsername, "id": senderId])
  }
  
  func dislikePost(senderId: String, postID: String, likes: Int) {
    let numberOfLikes = likes - 1
    let ref = Database.database().reference()
    ref.child("posts/\(senderId)/\(postID)/likes").setValue(numberOfLikes)
    ref.child("likes").child(postID).child(senderId).removeValue()
  }
  
  private init() {}
}
