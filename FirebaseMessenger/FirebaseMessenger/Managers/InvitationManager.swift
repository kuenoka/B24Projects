//
//  InvitationManager.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/6/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class InvitationManager {
  static let shared = InvitationManager()
  private var inviteRef: DatabaseReference!
  private var invites: [Invite] = []
   
  func setID() {
    inviteRef = Database.database().reference().child("invites").child(IDManager.shared.getID())
  }
  
  func getInvites(completion: @escaping ([Invite]) -> Void) {
    inviteRef.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : [String: String]] ?? [:]
      self.arrangeData(postDictionary: postDict)
      
      DispatchQueue.main.async {
        completion(self.invites)
      }
    })
  }
  
  private func arrangeData(postDictionary: [String : [String: String]]) {
    invites = []
    for friend in postDictionary.values {
      if let firstName = friend["friendFirstName"], let lastName = friend["friendLastName"], let messageiD = friend["messageID"], let id = friend["friendID"] {
        invites.append(Invite(friendID: id, friendFirstName: firstName, friendLastName: lastName, messageID: messageiD))
      }
    }
  }
  
  func getNumberOfInvites() -> Int {
    return invites.count
  }
  
  func addNewContact(friend: Invite) {
    let ref = Database.database().reference()
    let id = IDManager.shared.getID()
    ref.child("contacts").child(id).child(friend.friendID).setValue(["friendFirstName": friend.friendFirstName, "friendLastName": friend.friendLastName, "messageID": friend.messageID, "friendID": friend.friendID])
  }
  
  func removeInvite(friend: Invite) {
    inviteRef.child(friend.friendID).removeValue()
  }
  
  func getMyInvites() -> [Invite] {
    return invites
  }
  private init() {}
}
