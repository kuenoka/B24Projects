//
//  PostManager.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class PostManager {
  
  static let shared = PostManager()
  private var postRef: DatabaseReference!
  private var postStoreRef: StorageReference!
  private var posts: [Post] = []
  
  func setID(id: String) {
    postRef = Database.database().reference().child("posts").child(id)
    postStoreRef = Storage.storage().reference().child("postImages").child(id)
  }
  
  func getPosts(completion: @escaping ([Post])-> Void) {
    postRef.observe(.value) { (snapshot) in
      let postDic = snapshot.value as? [String : AnyObject ] ?? [:]
      
      self.arrangeData(postDict: postDic)
      DispatchQueue.main.async {
        completion(self.posts)
      }
    }
  }
  
  private func arrangeData(postDict: [String : AnyObject]) {
    posts = []
    for post in postDict.values {
    if let likes = post["likes"], let date = post["date"], let id = post["id"] {
      posts.append(Post(likes: likes as! Int, date: date as! String, id: id as! String))
      }
    }
  }
  
  func uploadPostLC(postImage: UIImage?) {
    let postID = UUID().uuidString
//    let id = IDManager.shared.getID()
    let date = getDate()
    postRef.child(postID).setValue(["likes": 0, "date": date, "id": postID])
    guard let data = postImage?.pngData() else { return }
    let uploadRef = postStoreRef.child(postID)
    let uploadTask = uploadRef.putData(data, metadata: nil) { (metadata, error) in }
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
  
  private func getDate() -> String {
    let date = Date()
    let df = DateFormatter()
    df.dateFormat = "MMM d, h:mm a"
    let dateString = df.string(from: date)
    return dateString
  }
  
  private init() {}
}
