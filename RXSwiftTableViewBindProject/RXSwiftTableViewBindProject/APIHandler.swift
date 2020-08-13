//
//  APIHandler.swift
//  RXSwiftTableViewBindProject
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import RxSwift

class APIHandler{
  
  public func callAPIFromApiHandler(withUrlString : String)
    -> Observable<Data?> {
      
      Observable<Data?>.create { observer  in
        
        URLSession.shared.dataTask(with: URL(string: withUrlString)!) { (data, response, error) in
          
          observer.onNext(data)
          if error != nil {
            observer.onError(error!)
          }
          observer.onCompleted()
          
        }.resume()
        let disposable = Disposables.create()
        return disposable
        
      }
  }
}

