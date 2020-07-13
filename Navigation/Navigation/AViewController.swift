//
//  AViewController.swift
//  Navigation
//
//  Created by Oluwafemi Adenaike on 7/8/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class AViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      noteTextView.delegate = self
    }
  
  @IBOutlet weak var noteTextView: UITextView!
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    print("start typing")
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    print("end typing")
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    return true
  }
  
  @IBAction func openB(_ sender: UIButton) {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "BViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
