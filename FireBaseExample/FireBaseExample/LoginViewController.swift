//
//  LoginViewController.swift
//  FireBaseExample
//
//  Created by Oluwafemi Adenaike on 7/29/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
  
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    ref = Database.database().reference()
  }
  
  @IBAction func signUpAction(_ sender: UIButton) {
    Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { authResult, error in
      // ...
      print(authResult)
      print(error)
      guard let userID = authResult?.user.uid else { return }
      self.ref.child("user").child(userID).setValue(["Phone Number": "", "Zip Code": "", "Hobby": "", "Gender": ""])
    }
    
  }
  
  
  @IBAction func signIn(_ sender: UIButton) {
    Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
      //guard let strongSelf = self else { return }
      // ...
      print(authResult?.user.isEmailVerified)
      print("")
      print("")
      print("")
      if error == nil {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "ProfileUpdateViewController") as ProfileUpdateViewController
        vc.userID = authResult?.user.uid
        self?.present(vc, animated: true, completion: nil)
      }
    }
  }
}
