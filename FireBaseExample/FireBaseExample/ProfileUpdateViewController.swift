//
//  ProfileUpdateViewController.swift
//  FireBaseExample
//
//  Created by Oluwafemi Adenaike on 7/29/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProfileUpdateViewController: UIViewController {
  
  @IBOutlet weak var genderTF: UITextField!
  @IBOutlet weak var hobbyTF: UITextField!
  @IBOutlet weak var zipCodeTF: UITextField!
  @IBOutlet weak var phoneNumberTF: UITextField!
  @IBOutlet weak var imgView: UIImageView!
  
  var ref: DatabaseReference!
  var userID: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ref = Database.database().reference()
    let refHandle = ref.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : AnyObject] ?? [:]
  
      guard let myUser = postDict["user"] else {return}
      //guard let userId = self.userID else {return}
      let myUSER = myUser[self.userID]
      print(myUSER)
      //genderTF.text = myUSER["Gender"]
      //hobbyTF.text = m
      // ...
    })
    //print(ref.child("user/\(userID)/Phone Number"))
  }
  
  
  @IBAction func save(_ sender: UIButton) {
    if let userId = userID {
      ref.child("user/\(userId)/Phone Number").setValue(phoneNumberTF.text)
      ref.child("user/\(userId)/Hobby").setValue(hobbyTF.text)
      ref.child("user/\(userId)/Zip Code").setValue(zipCodeTF.text)
      ref.child("user/\(userId)/Gender").setValue(genderTF.text)
    }
  }
  
}
