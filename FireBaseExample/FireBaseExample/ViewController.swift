//
//  ViewController.swift
//  FireBaseExample
//
//  Created by Oluwafemi Adenaike on 7/29/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseDatabase
import GoogleSignIn

class ViewController: UIViewController {

   var ref: DatabaseReference!
   var citiesRef: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    GIDSignIn.sharedInstance()?.presentingViewController = self

    // Automatically sign in the user.
    GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    ref = Database.database().reference()
    self.ref.child("cities").child("1").setValue(["name": "Mumbai"])
    self.ref.child("cities").child("2").setValue(["name": "Beijing"])
    
    //let userID = Auth.auth().currentUser?.uid
    // fetch city with id 1
    ref.child("cities").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
      // Get user value
      let value = snapshot.value as? NSDictionary
      let name = value?["name"] as? String ?? ""
      //let user = User(username: username)
      print(name)
      // ...
      }) { (error) in
        print(error.localizedDescription)
    }
    
    //update city with id 2
    ref.child("cities").child("2").setValue(["name": "New York"]) {
      (error:Error?, ref:DatabaseReference) in
      if let error = error {
        print("Data could not be saved: \(error).")
      } else {
        print("Data saved successfully!")
      }
    }
    
    
    citiesRef = Database.database().reference().child("cities")
    let ref1 = citiesRef.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : AnyObject]
      // ...
      print(postDict)
      if let value = snapshot.value as? [String: Any] {
          let name = value["name"] as? String ?? ""
          //let owner = value["city"] as? String ?? ""
          print(name)
      }
    })
    
    //delete command
    ref.child("99").child("2").removeValue()
    
    // Listen for new comments in the Firebase database
    ref.observe(.childAdded, with: { (snapshot) -> Void in
      print(snapshot)
    })
    // Listen for deleted entire cities in the Firebase database
    ref.observe(.childRemoved, with: { (snapshot) -> Void in
      print(snapshot)
    })
    
    ref.observe(.value) { snapshot in
      for child in snapshot.children {
        print(child)
      }
    }
    
    // My top posts by number of stars
    let myTopPostsQuery = (ref.child("hobby").child("1").queryOrdered(byChild: "name"))
    print(myTopPostsQuery)
  }


}

