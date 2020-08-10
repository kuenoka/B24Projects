//
//  ProfileViewController.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/3/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var firstName: UITextField!
  @IBOutlet weak var lastName: UITextField!
  @IBOutlet weak var saveButtton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addProfileTitle()
    saveButtton.layer.cornerRadius = 5
    ProfileManager.shared.setID()
    setUp()
    addSignOut()
  }
  
  @IBAction func save(_ sender: UIButton) {
    guard let firstname = firstName.text, let lastname = lastName.text else { return }
    ProfileManager.shared.updateUser(firstName: firstname, lastName: lastname)
  }
  
  func addSignOut() {
    let btn = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOutAction))
    self.navigationItem.rightBarButtonItem = btn
  }
  
  @objc func signOutAction() {
    do {
      try Auth.auth().signOut()
    } catch {
      print("Could not sign out")
    }
    self.dismiss(animated: true, completion: nil)
  }
  
  func addProfileTitle() {
    let title = UILabel()
    title.text = "Profile"
    title.textColor = .red
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  func setUp() {
    ProfileManager.shared.getUserFromDataBase{ (first,last) in
      self.firstName.text = first
      self.lastName.text = last
    }
  }
}
