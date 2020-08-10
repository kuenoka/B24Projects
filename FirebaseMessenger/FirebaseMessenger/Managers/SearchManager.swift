//
//  SearchManager.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/5/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SearchManager {
  static let shared = SearchManager()
  private var searchRef = Database.database().reference().child("users")
  private var users: [User] = []
  private var msgID: String!
   
  func getUsers(completion: @escaping ([User]) -> Void) {
    searchRef.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : [String: String]] ?? [:]
      self.arrangeData(postDictionary: postDict)
      
      DispatchQueue.main.async {
        completion(self.users)
      }
    })
  }
  
  private func arrangeData(postDictionary: [String : [String: String]]) {
    var firstNames: [String] = []
    var lastNames: [String] = []
    var userIDs: [String] = []
    users = []
    for user in postDictionary.values {
      if let firstName = user["firstName"], let lastName = user["lastname"] {
        firstNames.append(firstName)
        lastNames.append(lastName)
      }
    }
    
    for users in postDictionary.keys {
      userIDs.append(users)
    }
    for i in 0..<firstNames.count {
      if firstNames[i] != ProfileManager.shared.getFirstName() {
        users.append(User(firstName: firstNames[i], lastName: lastNames[i], id: userIDs[i]))
      }
    }
  }
  
  func getNumberOfUsers() -> Int {
    return users.count
  }
  
  func addNewContact(friend: User) {
    let canBeInvited = alreadyInvited(user: friend)
    let hasC = hasContact(user: friend)
    if hasC {
      if canBeInvited.0 {
        msgID = UUID().uuidString
      } else {
        msgID = canBeInvited.1
      }
      let ref = Database.database().reference()
      let id = IDManager.shared.getID()
      ref.child("contacts").child(id).child(friend.id).setValue(["friendFirstName": friend.firstName, "friendLastName": friend.lastName, "messageID": msgID, "friendID": friend.id])
    }
  }
  
  func sendInvite(friend: User) {
    let canBeInvited = alreadyInvited(user: friend)
    let hasC = hasContact(user: friend)
    if canBeInvited.0 && hasC {
      let ref = Database.database().reference()
      let id = IDManager.shared.getID()
      let user = ProfileManager.shared.getUser()
      ref.child("invites").child(friend.id).child(id).setValue(["friendFirstName": user.firstName, "friendLastName": user.lastName, "messageID": msgID, "friendID": user.id])
    }
  }
  
  func alreadyInvited(user: User) -> (Bool, String) {
    let invites = InvitationManager.shared.getMyInvites()
    var canBeInvited = true
    var messgageID = ""
    for i in 0 ..< invites.count {
      if user.id == invites[i].friendID {
        canBeInvited = false
        messgageID = invites[i].messageID
      }
    }
    return (canBeInvited, messgageID)
  }
  
  func hasContact(user: User) -> Bool {
    let contacts = ContactManager.shared.getContacts()
    var hasC = true
    for i in 0 ..< contacts.count {
      if user.id == contacts[i].friendID {
        hasC = false
      }
    }
    return hasC
  }
  
  func removeInvite(friend: User) {
    let inviteRef = Database.database().reference().child("invites").child(IDManager.shared.getID())
    inviteRef.child(friend.id).removeValue()
  }
  
  private init() {}
}
