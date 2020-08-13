//
//  ViewController.swift
//  RxSwiftProject
//
//  Created by Oluwafemi Adenaike on 8/12/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  
  @IBOutlet weak var lblDisplay: UILabel!
  @IBOutlet weak var txt1: UITextField!
  @IBOutlet weak var txt2: UITextField!
  @IBOutlet weak var lblSumResult: UILabel!
  @IBOutlet weak var txt: UITextField!
  @IBOutlet weak var lbl: UILabel!
  
  let observable = BehaviorRelay<Int>(value: 0)
  let observableSum = BehaviorRelay<Int>(value: 0)
  let disposeBag = DisposeBag()
  let disposeBag2 = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    behaviorRelaySubject()
    behaviorRelaySubjectSum()
    txt.rx.text.bind(to: lbl.rx.text).disposed(by: disposeBag2)
  }

  
  @IBAction func increaseClicked(_ sender: UIButton) {
    observable.accept(observable.value + 1)
  }
  
  
  @IBAction func decreaseClicked(_ sender: UIButton) {
    observable.accept(observable.value - 1)
  }
  
  
  @IBAction func sumClicked(_ sender: UIButton) {
    observableSum.accept(Int(txt1.text!)!+Int(txt2.text!)!)
  }
  
  func behaviorRelaySubject() {
    observable.subscribe(onNext: { value in
      print(value)
      self.lblDisplay.text = "\(value)"
    }, onError: { error in
      print(error)
    }, onCompleted: {
      print("Completed")
    }, onDisposed: {
      print("Disposed")
    }).disposed(by: disposeBag)
  }

  func behaviorRelaySubjectSum() {
      observableSum.subscribe(onNext: { value in
        print(value)
        self.lblSumResult.text = "\(value)"
      }, onError: { error in
        print(error)
      }, onCompleted: {
        print("Completed")
      }, onDisposed: {
        print("Disposed")
      }).disposed(by: disposeBag)
    }
  
}

