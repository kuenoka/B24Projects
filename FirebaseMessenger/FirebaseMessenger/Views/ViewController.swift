//
//  ViewController.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/2/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {
  
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    ref = Database.database().reference()
    addTitle()
  }
  
  func addTitle() {
    let title = UILabel()
    title.text = "FireBaseMessenger"
    title.textColor = .red
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  @IBAction func signIn(_ sender: UIButton) {
    guard var userName = username.text, let passWord = password.text else { return }
    userName = userName + "@gmail.com"
    Auth.auth().signIn(withEmail: userName, password: passWord) { (authResult, error) in
      if error == nil {
        if let iD = authResult?.user.uid {
          IDManager.shared.setID(myID: iD)
          let st = UIStoryboard(name: "Main", bundle: nil)
          let vc = st.instantiateViewController(withIdentifier: "TabBarController")
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
        }
      }
    }
  }
  
  @IBAction func signUp(_ sender: UIButton) {
    guard let userName = username.text, let passWord = password.text else { return }
    let email = userName + "@gmail.com"
    Auth.auth().createUser(withEmail: email, password: passWord) { (authResult, error) in
      if error == nil {
        if let iD = authResult?.user.uid {
          IDManager.shared.setID(myID: iD)
          self.ref.child("users").child(iD).setValue(["firstName": "", "lastname": ""])
          let st = UIStoryboard(name: "Main", bundle: nil)
          let vc = st.instantiateViewController(withIdentifier: "TabBarController")
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
        }
      }
    }
  }
  
}

