//
//  APIHandler.swift
//  MVVM_Project
//
//  Created by Oluwafemi Adenaike on 8/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

class APIHandler {
  
  var closure: ((Data?, URLResponse?, Error?)->())?
  
  func getData(urlString: String) {
    URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
      DispatchQueue.main.async {
        self.closure?(data, response, error)
      }
    }.resume()
  }
}
