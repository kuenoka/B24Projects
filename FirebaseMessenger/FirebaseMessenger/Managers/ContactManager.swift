//
//  ContactManager.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/5/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class ContactManager {
  static let shared = ContactManager()
  private var contactRef: DatabaseReference!
  private var contacts: [Contact] = []
  
  func setID() {
    contactRef = Database.database().reference().child("contacts").child(IDManager.shared.getID())
  }
  
  func getData( completion: @escaping ([Contact]) -> Void) {
    contactRef.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : [String: String]] ?? [:]
      self.arrangedata(postDictionary: postDict)
      self.contacts.sort(by: {$0.friendFirstName < $1.friendFirstName})
      DispatchQueue.main.async {
        completion(self.contacts)
      }
    })
  }
  
  private func arrangedata(postDictionary: [String : [String: String]]) {
    contacts = []
    for friend in postDictionary.values {
      if let firstName = friend["friendFirstName"], let lastName = friend["friendLastName"], let messageID = friend["messageID"], let id = friend["friendID"] {
        contacts.append(Contact(friendID: id, friendFirstName: firstName, friendLastName: lastName, messageID: messageID))
      }
    }
  }
  
  func getNumberOfContacts() -> Int {
    return contacts.count
  }
  
  func getContacts() -> [Contact] {
      return contacts
  }
  
  private init() {}
}
