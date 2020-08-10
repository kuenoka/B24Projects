//
//  ToDoModel.swift
//  B24UnitTest
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

struct ToDoModel: Codable {
  var userId: Int
  var id: Int
  var title: String
  var completed: Bool
}
