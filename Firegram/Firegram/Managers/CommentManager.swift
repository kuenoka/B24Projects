//
//  CommentManager.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class CommentManager {
  
  static let shared = CommentManager()
  private var commentRef: DatabaseReference!
  private var comments: [Comment] = []
  
  func setID(postID:String) {
    commentRef = Database.database().reference().child("comments").child(postID)
  }
  
  func getComments(completionHandler: @escaping ([Comment]) -> Void) {
    commentRef.observe(.value, with: { (snapshot) in
      let postDic = snapshot.value as? [String: AnyObject] ?? [:]
      self.arrangeData(postDictionary: postDic)
      let df = DateFormatter()
      df.dateFormat = "MMM d, h:mm a"
      self.comments.sort(by: {df.date(from: $0.date)! < df.date(from: $1.date)!})
      DispatchQueue.main.async {
        completionHandler(self.comments)
      }
    })
  }
  
  private func arrangeData(postDictionary: [String: AnyObject]) {
    comments = []
    for commentUnit in postDictionary.values {
      print(commentUnit)
      if let comment = commentUnit["comment"], let senderusername = commentUnit["senderusername"], let senderID = commentUnit["senderID"], let commentID = commentUnit["commentID"], let date = commentUnit["date"] {
        let newComment = Comment(comment: comment as! String, senderusernmae: senderusername as! String, senderID: senderID as! String, commentID: commentID as! String, date: date as! String)
        comments.append(newComment)
      }
    }
  }
  
  
  func makeComment( comment: String) {
    let commentId = UUID().uuidString
    let date = getDate()
    let profileUsername = ProfileManager.shared.getMyProfile().username
    let senderId = ProfileManager.shared.getMyProfile().id
    commentRef.child(commentId).setValue(["comment": comment, "senderusername":profileUsername, "senderID": senderId, "commentID": commentId, "date": date])
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
