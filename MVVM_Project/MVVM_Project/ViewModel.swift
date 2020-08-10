//
//  ViewModel.swift
//  MVVM_Project
//
//  Created by Oluwafemi Adenaike on 8/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

class ViewModel {
  
  let apiHandler = APIHandler()
  var arr = [UserInfo]()
  var errorString = ""
  var response: URLResponse?
  var closure: (()->())?
  
  func getData(urlString: String) {
    apiHandler.getData(urlString: urlString)
    apiHandler.closure = { (data, response, error) in
      self.arr = try! JSONDecoder().decode([UserInfo].self, from: data!)
      self.errorString = error.debugDescription
      self.response = response
      self.closure?()
    }
    return
  }
  
  func getRows() -> Int {
    return arr.count
  }
  
  func getObject(index: Int) -> UserInfo {
    if arr.count > 0 {
      return arr[index]
    } else {
      return UserInfo(userId: 0, id: 0, title: "", completed: false)
    }
  }
  
  func getCapitalized(string: String) -> String {
    return string.capitalized
  }
  
  func getError() -> String? {
    return errorString
  }
}
