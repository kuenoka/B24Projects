//
//  ProfileManager.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/5/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class ProfileManager {
  static let shared = ProfileManager()
  private var profileRef: DatabaseReference!
  private var user = User(firstName: "", lastName: "", id: "")
  
  func setID() {
    profileRef = Database.database().reference().child("users").child(IDManager.shared.getID())
  }
  
  func updateUser(firstName: String, lastName: String) {
    profileRef.setValue(["firstName": firstName, "lastname": lastName])
  }
  
  func getUserFromDataBase(completion: @escaping (String, String) -> Void) {
    profileRef.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : String] ?? [:]
      if let firstname = postDict["firstName"], let lastname = postDict["lastname"] {
        self.user = User(firstName: firstname, lastName: lastname, id: IDManager.shared.getID())
      }
      DispatchQueue.main.async {
        completion(self.user.firstName, self.user.lastName)
      }
    })
  }
  
  func getUser() -> User {
    return user
  }
  
  func getFirstName() -> String {
    return user.firstName
  }
  
  func getLastName() -> String {
    return user.lastName
  }
  
  func getID() -> String {
    return user.id
  }
  
  private init() {}
}
