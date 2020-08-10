//
//  MessageManager.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/6/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class MessageManager {
  static let shared = MessageManager()
  
  private var messageRef: DatabaseReference!
  private var messages: [Message] = []
  
  func setID(id: String) {
    messageRef = Database.database().reference().child("messages").child(id)
  }
  
  func getData( completion: @escaping ([Message]) -> Void) {
    messageRef.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : [String: AnyObject]] ?? [:]
      self.arrangedata(postDictionary: postDict)
      self.messages.sort(by: {$0.id < $1.id})
      DispatchQueue.main.async {
        completion(self.messages)
      }
    })
  }
  
  private func arrangedata(postDictionary: [String : [String: AnyObject]]) {
    messages = []
    for messageIn in postDictionary.values {
      if let message = messageIn["message"], let sender = messageIn["sender"], let iD = messageIn["id"], let date = messageIn["date"] {
        messages.append(Message(sender: sender as! String, message: message as! String, id: iD as! Int, date: date as! String))
      }
    }
  }
  
  func getNumberOfContacts() -> Int {
    return messages.count
  }
  
  func postMessage(message: Message) {
    let msgID = UUID().uuidString
    let date = getDate()
    messageRef.child(msgID).setValue(["message": message.message, "sender": message.sender, "id": message.id, "date": date])
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
