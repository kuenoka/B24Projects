//
//  DetailViewControllerProtocol.swift
//  ProtocolDelegate
//
//  Created by Oluwafemi Adenaike on 7/17/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

protocol DetailViewControllerProtocol {
  func addEntry(entry: String)
  func reloadTableView()
  func prettyPrint()
}

extension DetailViewControllerProtocol {
  func prettyPrint() {
    //blah
    //blah
  }
}
