//
//  ViewController.swift
//  GCD_OPQ
//
//  Created by Oluwafemi Adenaike on 7/21/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var firstImageView: UIImageView!
  @IBOutlet weak var secondImageView: UIImageView!
  @IBOutlet weak var thirdImageView: UIImageView!
  @IBOutlet weak var fourthImageView: UIImageView!
  
  let sq = DispatchQueue(label: "a.b.c") // serial
  let cq = DispatchQueue.global() //conqurrent
  var workItem1: DispatchWorkItem?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    test()
    DispatchGroup1()
    workItem1 = DispatchWorkItem {
      self.getImage(imageView: self.firstImageView, string: stringUrl1)
    }
    
  }
  
  func getImage(imageView: UIImageView, string: String) {
    if let urlUnwrapped = URL.init(string: string) {
      do {
        let data = try Data(contentsOf: urlUnwrapped)
        let i = UIImage.init(data: data)
        DispatchQueue.main.async {
          imageView.image = i
        }
      } catch {
        
      }
    }
  }
  
  @IBAction func serialDownload(_ sender: UIButton) {
//    sq.async {
//      self.getImage(imageView: self.firstImageView, string: stringUrl1)
//    }
    //above code is same as below work item
    sq.async(execute: workItem1!)
    
    sq.async {
      self.getImage(imageView: self.secondImageView, string: stringUrl2)
    }
    sq.async {
      self.getImage(imageView: self.thirdImageView, string: stringUrl3)
    }
    sq.async {
      self.getImage(imageView: self.fourthImageView, string: stringUrl4)
    }
  }
  
  @IBAction func concurrentDownload(_ sender: UIButton) {
    cq.async {
      self.getImage(imageView: self.firstImageView, string: stringUrl1)
    }
    cq.async {
      self.getImage(imageView: self.secondImageView, string: stringUrl2)
    }
    cq.async {
      self.getImage(imageView: self.thirdImageView, string: stringUrl3)
    }
    cq.async {
      self.getImage(imageView: self.fourthImageView, string: stringUrl4)
    }
  }
  
  @IBAction func Erase(_ sender: UIButton) {
    self.firstImageView.image = nil
    self.secondImageView.image = nil
    self.thirdImageView.image = nil
    self.fourthImageView.image = nil
  }
  
  func test() {
    
    let q1 = DispatchQueue.init(label: "123")
    q1.async {
      let conQ = DispatchQueue.global()
      conQ.async {
        //a
        print("a")
      }
      conQ.async {
        //b
        print("b")
      }
      conQ.async {
        //c
        print("c")
      }
    }
    q1.async {
      //d
      print("d")
    }
  }
    
  func DispatchGroup1() {
    
    let dg = DispatchGroup()
    //let q1 = DispatchQueue.init(label: "blah")
    let q1 = DispatchQueue.global()
    
    dg.enter()
    q1.async {
      self.getImage(imageView: self.firstImageView, string: stringUrl1)
      self.getImage(imageView: self.secondImageView, string: stringUrl2)
      self.getImage(imageView: self.thirdImageView, string: stringUrl3)
      dg.leave()
    }
    
    //task d after all
    dg.notify(queue: .main) {
      q1.async {
        self.getImage(imageView: self.fourthImageView, string: stringUrl4)
      }
    }
  }
  
}

