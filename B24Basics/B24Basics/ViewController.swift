//
//  ViewController.swift
//  B24Basics
//
//  Created by Oluwafemi Adenaike on 7/6/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var obj1: String?
  
  @objc func btnClicked() {
    var isOn = true
    isOn.toggle()
    isOn = !isOn
    
    var array = [1, 2, 3, 4]
    array.shuffle()
    print(array)
    
    let array2 = [1, 2, 3, 4]
    let shuffledArray = array2.shuffled()
    print(shuffledArray, array)
    
    let toCheckAllSatisfyArr = ["amit","amitmumar"]
    toCheckAllSatisfyArr.allSatisfy{ (str) -> Bool in
      return str.count > 0
    }
    
    let array3 = [1,3,5,7]
    let randomNumber1 = array3.randomElement()
    
    #warning("Need to implement in next sprint")
   // #error("I will not let you compile if you dont complete this")
  }
  
  @objc func openLoginAction() {
    let sb = UIStoryboard.init(name: "LoginModule", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "LoginViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = UIColor.green
    
//    for i in 1...2 {
//      let loopframe = CGRect(x: 0, y: 65 + (i*40), width: 70, height: 40)
//      let btn = UIButton.init(frame: loopframe)
//    }
    
    let frameOfOpenLogin = CGRect(x: 0, y: 65, width: 70, height: 40)
    let btn = UIButton.init(frame: frameOfOpenLogin)
    btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    view.addSubview(btn)
    btn.setTitle("Hi", for: .normal)
    btn.backgroundColor = .lightGray
    
    let secondFrameOfOpenLogin = CGRect(x: 100, y: 100, width: 100, height: 40)
    let openLoginBtn = UIButton.init(frame: secondFrameOfOpenLogin)
    openLoginBtn.addTarget(self, action: #selector(openLoginAction), for: .touchUpInside)
    view.addSubview(openLoginBtn)
    openLoginBtn.setTitle("Open Login", for: .normal)
    openLoginBtn.backgroundColor = .lightGray
    
    let yOfNewLabel = btn.frame.origin.y + btn.frame.origin.y
    let padding: CGFloat = 10
    let lb1 = UILabel.init(frame: CGRect(x: btn.frame.origin.x, y: yOfNewLabel + padding, width: 70, height: 40))
    lb1.backgroundColor = .systemPink
    lb1.text = "blah blah"
    view.addSubview(lb1)
    
      
    mapEx()
    compactMapEx()
    flatMapEx()
    
    ["name": "alok", "hobby": "teach"]
    
    enum info: CaseIterable {
      case name
      case hobby
    }
  
    var mInfo = [info: String]()
    
    for i in info.allCases {
      switch i {
      case .hobby:
          mInfo[.hobby] = "teaching"
      case .name:
           mInfo[.name] = "alok"
      }
    }
    
    
    
    let p1 = Person2.init(name: "Jerry")
    let p2 = Person2.init(name: "Chen")
    let p3 = Person2.init(name: "Nurlybek")
    let p4 = Person2.init(name: "Sheryl")
    let p5 = Person2.init(name: "Alok")
    let p6 = Person2.init(name: "Kingsley")
    let classMates = [p1.name, p2.name, p3.name, p4.name, p5.name, p6.name]
    let solution = classMates.filter({
      $0.count > 5
    })
    print(solution)
  }

  func mapEx() {
    print("mapEx: \(["amit", "alok"].map({$0.capitalized}))")
  }
  
  func flatMapEx() {
    print("flatMapEx \([[1,2],[101,11],[12,77]].flatMap({$0}))")
  }
  
  func compactMapEx() {
    let op1: String? = "Alok"
    let op2: String? = "Amit"
    
    let arr = [op1, op2, nil, "lokesh", "Shobh"]
    let unwrappedVarsArray = arr.compactMap({$0})
    print("compactMapEx \(unwrappedVarsArray)")
  }
  
  func filterExample() {
    let res = ["alok u", "romi", "naitvik"].filter({
      $0.count > 4
    })
    print(res)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  
  @IBAction func openLogin2(_ sender: UIButton) {
    // ref login module storyboard
    // obj = get obj/scene id
    // perform present /push
    
    let title = sender.title(for: .normal)
    
    print(title)
    
    let id = sender.tag
    
    let st = UIStoryboard.init(name: "LoginModule", bundle: nil)
    let vc = st.instantiateViewController(identifier: "LoginViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
  
  @IBAction func openForget(_ sender: Any) {
    let st = UIStoryboard.init(name: "LoginModule", bundle: nil)
    let vc = st.instantiateViewController(identifier: "ForgetViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
  
  @IBAction func doSomethin3(_ sender: UIButton) {
    doSomething(theTag: sender.tag)
  }
  
  @IBAction func doSomething4(_ sender: UIButton) {
  }
  
  @IBAction func sliderChange(_ sender: UISlider) {
    view.alpha = CGFloat(sender.value)
  }
  
  
  @IBAction func segmentChange(_ sender: UISegmentedControl) {
    sender.selectedSegmentIndex == 0 ? "" :  " "
    print(sender)
    if sender.selectedSegmentIndex == 1 {
        view.backgroundColor = UIColor.brown
    }else{
        view.backgroundColor = UIColor.yellow

    }
  }
  
  @IBAction func presentModule(_ sender: UIButton) {
    let st = UIStoryboard.init(name: "LoginModule", bundle: nil)
    let vc = st.instantiateViewController(identifier: "LoginViewController")
    present(vc, animated: true) {
      print("Just Finished")
    }
  }
  
  
  func doSomething(theTag: Int) {
    
    if theTag == 3 {
      print("the tag is 3")
    }
    
    if theTag == 4 {
      print("the tag is 4")
    }
  }
}

class Person2 {
  var name: String
  init(name: String) {
    self.name = name
  }
}
