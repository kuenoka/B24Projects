//
//  ViewModel.swift
//  RXSwiftTableViewBindProject
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import RxSwift
import RxCocoa

class ViewModel{
  
  
  let dataSource: BehaviorRelay<[ItemModel]> = BehaviorRelay(value: [])
  var error : Error?
  let disposeBag = DisposeBag()

  
  public func callAPIFromViewModel(withUrlString : String) {
      
      let disposable = APIHandler.init().callAPIFromApiHandler(withUrlString : withUrlString).subscribe(onNext: { (data) in

        let jsonDcoderObj = JSONDecoder.init()

        do{
          let model = try jsonDcoderObj.decode([ItemModel].self, from: data!)
          self.dataSource.accept(model)
        }catch{
          //error
          self.error = error
        }

      }, onError: { (error) in
        self.error = error
      }, onCompleted: {

      }) {
        print("Disposed")
    }
    disposable.disposed(by: disposeBag)
  }
  
}

