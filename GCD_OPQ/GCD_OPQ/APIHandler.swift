//
//  APIHandler.swift
//  GCD_OPQ
//
//  Created by Oluwafemi Adenaike on 7/22/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

typealias CompletionHandler = ((Data?, URLResponse?, Error?)->())?

class APIHandler {
  
  var closureCallBack: ((Data?, URLResponse?, Error?)->())?
  var apiHandlerDelegate: APIHandlerDelegate?
  
  func getDataFromServer() {
    let urlSession = URLSession.shared
    var urlRequest = URLRequest.init(url: URL(string: "https://jsonplaceholder.typicode.com/todos/")!)
    urlRequest.httpMethod = "GET"

    urlSession.dataTask(with: urlRequest) { (data, response, error) in
      DispatchQueue.main.async {
        self.closureCallBack?(data, response, error)
      }
    }.resume()
  }

  func getDataFromServer(completionHandler: CompletionHandler) {
      let urlSession = URLSession.shared
      var urlRequest = URLRequest.init(url: URL(string: "https://jsonplaceholder.typicode.com/todos/")!)
      urlRequest.httpMethod = "GET"
  
      urlSession.dataTask(with: urlRequest) { (data, response, error) in
        DispatchQueue.main.async {
          completionHandler?(data, response, error)
        }
      }.resume()
    }
  
  func getDataFromServerWithNotif() {
    let urlSession = URLSession.shared
    var urlRequest = URLRequest.init(url: URL(string: "https://jsonplaceholder.typicode.com/todos/")!)
    urlRequest.httpMethod = "GET"

    urlSession.dataTask(with: urlRequest) { (data, response, error) in
      DispatchQueue.main.async {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Notification_DataReceived), object: nil, userInfo: ["data" : (data, response, error)])
      }
    }.resume()
  }
  
  func getDataFromServerWithDelegate() {
    let urlSession = URLSession.shared
    var urlRequest = URLRequest.init(url: URL(string: "https://jsonplaceholder.typicode.com/todos/")!)
    urlRequest.httpMethod = "GET"

    urlSession.dataTask(with: urlRequest) { (data, response, error) in
      DispatchQueue.main.async {
        self.apiHandlerDelegate?.sendData(data: data, response: response, error: error)
      }
    }.resume()
  }
}

protocol APIHandlerDelegate {
  func sendData(data: Data?, response: URLResponse?, error: Error?)
}

