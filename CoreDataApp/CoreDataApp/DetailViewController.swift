//
//  DetailViewController.swift
//  CoreDataApp
//
//  Created by Oluwafemi Adenaike on 7/23/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

//protocol DetailViewControllerProtocol {
//  func didCompleteSavingData()
//}

class DetailViewController: UIViewController {
  
  @IBOutlet weak var txtField: UITextField!
  @IBOutlet weak var addressTextField: UITextField!
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  //var delegate: DetailViewControllerProtocol?
  var person: Person?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    GIDSignIn.sharedInstance()?.presentingViewController = self

    // Automatically sign in the user.
    GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    if person != nil {
      txtField.text = person?.name
      addressTextField.text = person?.address?.street
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    Analytics.setScreenName("Detail Screen", screenClass: "DetailViewController")
  }
  
  @IBAction func saveData(_ sender: UIButton) {
    if txtField.text?.count == 0 {
      return
    }
    
    let name = txtField.text
    let address = addressTextField.text
    
    if self.person != nil {
      person?.name = name
      person?.address?.street = address
    } else {
      let moc = CoreDataManager.shared.getMaintContext()
         let p = Person.init(context: moc)
         let addressDB = Address.init(context: moc)
         addressDB.street = address
         p.name = name
         p.address = addressDB
         //AppDelegate.appD.saveContext()
         
         CoreDataManager.shared.insert(entity: p, moc: moc)
         CoreDataManager.shared.insert(entity: addressDB, moc: moc)
         
    }
    CoreDataManager.shared.saveContext()
    dismiss(animated: true){
      //self.delegate?.didCompleteSavingData()
    }
    
  }
  
  @IBAction func submitAction(_ sender: UIButton) {
    Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
      // ...
      print(authResult)
      print(error)
    }
  }
  
  @IBAction func loginAction(_ sender: UIButton) {
    Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
      //guard let strongSelf = self else { return }
      // ...
      print(authResult?.user.isEmailVerified)
    }
  }
  
}
