//
//  IDManager.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/5/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

class IDManager {
  
  static let shared = IDManager()
  private var iD: String!
  
  func setID(myID: String) {
    iD = myID
  }
  
  func getID() -> String {
    return iD
  }
  
  private init() {}
  
}
