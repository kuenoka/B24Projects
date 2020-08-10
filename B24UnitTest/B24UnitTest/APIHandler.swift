//
//  APIHandler.swift
//  B24UnitTest
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

protocol  SessionProtocol {
  func fetchData(url:URL, completion: @escaping(Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: SessionProtocol {
  func fetchData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
    let task = dataTask(with: url, completionHandler: completion)
    task.resume()
  }
}

class APIHandler {
  
  var urlSession: SessionProtocol
  
  init(session: SessionProtocol){
    urlSession = session
  }
  
  let urlString = "https://jsonplaceholder.typicode.com/todos"
  
  func fetchToDoItems(completionHandler: @escaping ([ToDoModel]?) -> Void) {
    guard let url = URL(string: urlString) else {
      completionHandler(nil)
      return
    }
    
    urlSession.fetchData(url: url) { (data, response, error) in
//      guard let resp = response as? HTTPURLResponse else {
//        completionHandler(nil)
//        return
//      }
      if error == nil {
        do {
          let models = try JSONDecoder().decode([ToDoModel].self, from: data!)
          //print(models)
          completionHandler(models)
        } catch {
          print("there is error in parsing")
          completionHandler(nil)
        }
      }
    }
  }
}

//mocking - instead of having an actual object we can have a dummy object (Dependency injection?)
//why swift uses Protocol Oriented Programming

//class APIHandler {
//
//  let urlString = "https://jsonplaceholder.typicode.com/todos"
//
//  func fetchToDoItems(completionHandler: @escaping ([ToDoModel]?) -> Void) {
//    guard let url = URL(string: urlString) else {
//      completionHandler(nil)
//      return
//    }
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//      guard let resp = response as? HTTPURLResponse else {
//        completionHandler(nil)
//        return
//      }
//      if resp.statusCode == 200 {
//        do {
//          let models = try JSONDecoder().decode([ToDoModel].self, from: data!)
//          print(models)
//          completionHandler(models)
//        } catch {
//          print("there is error in parsing")
//          completionHandler(nil)
//        }
//      }
//    }.resume()
//  }
//}
