//
//  ViewController.swift
//  RXSwiftApiTableViewProject
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  
  @IBOutlet weak var tblView: UITableView!
  var disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    callAPI().subscribe(onNext: { (arrPostInfo) in
      
      //relaod data
      print(arrPostInfo.first?.title)
      
    }, onError: { (error) in
      
    }, onCompleted: {
      
    }) {
      
    }.disposed(by: disposeBag)
  }

  func callAPI()->Observable<[PostInfo]> {
    Observable<[PostInfo]>.create{ (observer)-> Disposable in
      URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!){ (data, response, error) in
        
        DispatchQueue.main.async {
          if error == nil {
            let postInfoArr = try! JSONDecoder().decode([PostInfo].self, from: data!)
            observer.onNext(postInfoArr)
          } else {
            observer.onError(error!)
          }
        }
        
      }.resume()
      let adisposable = Disposables.create()
      return adisposable
    }
  }
}

struct PostInfo: Codable {
  var userId: Int
  var id: Int
  var title: String
  var completed: Bool
}
