//
//  ViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/9/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

  var ref: DatabaseReference!
  @IBOutlet weak var userName: UITextField!
  @IBOutlet weak var passWord: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addSignInTitle()
    ref = Database.database().reference().child("profiles")
  }

  func addSignInTitle() {
    let title = UILabel()
    title.text = "Firegram"
    title.textColor = .black
    title.textAlignment = .center
    navigationItem.titleView = title
  }

  @IBAction func signUpAction(_ sender: UIButton) {
    guard let username = userName.text, let password = passWord.text else { return }
    let email = username + "@gmail.com"
    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
      if error == nil {
        if let id = authResult?.user.uid {
          ProfileManager.shared.setID(id: id)
          PostManager.shared.setID(id: id)
          //FeedManager.shared.setID(id: id)
          self.ref.child(id).setValue(["username": username, "firstname": "", "lastname": "", "followers": 0,"following": 0,"posts": 0, "id": id])
          let sb = UIStoryboard(name: "Main", bundle: nil)
          let tb = sb.instantiateViewController(identifier: "TabBarController")
          tb.modalPresentationStyle = .fullScreen
          self.present(tb, animated: true, completion: nil)
        }
      }
    }
  }
  
  @IBAction func signInAction(_ sender: UIButton) {
    guard let username = userName.text, let password = passWord.text else { return }
    let email = username + "@gmail.com"
    Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
      if error == nil {
        if let id = authResult?.user.uid {
          ProfileManager.shared.setID(id: id)
          PostManager.shared.setID(id: id)
          //FeedManager.shared.setID(id: id)
          let sb = UIStoryboard(name: "Main", bundle: nil)
          let tb = sb.instantiateViewController(identifier: "TabBarController")
          tb.modalPresentationStyle = .fullScreen
          self.present(tb, animated: true, completion: nil)
        }
      }
    }
  }
}

