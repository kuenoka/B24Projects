//
//  Info.swift
//  GCD_OPQ
//
//  Created by Oluwafemi Adenaike on 7/21/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

struct Info: Codable {
  var user_Id: Int
  var id: Int
  var title: String
  var completed: Bool
  
  //local ==> Server
  enum CodingKeys: String, CodingKey {
    case user_Id = "userId"
    case id = "id"
    case title = "title"
    case completed = "completed"
  }
}

