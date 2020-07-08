//
//  LoginViewController.swift
//  B24Basics
//
//  Created by Oluwafemi Adenaike on 7/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  @IBAction func btnLoginClicked(_ sender: Any) {
    let username = usernameTextField.text
    let password = passwordTextField.text
    
    let usernameCount = username?.count ?? 0
    let passwordCount = password?.count ?? 0
    
    //class example preferred
    if (usernameCount == 0) && (passwordCount == 0) {
       //show some alert both can not be empty
        
        //create alert object
        let alert = UIAlertController.init(title: "Error!!!", message: "Both field cannot be empty", preferredStyle: .alert)
        
        //create action object
        let action = UIAlertAction.init(title: "OK", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
            
        }
        
        //add action to alert
        alert.addAction(action)
        
        //present finally
    
        present(alert, animated: true, completion: nil)
        
        return
    }
    
    // computer example
    if (usernameCount == 0) {
      // show some alert username count cannot be empty
      let alert = UIAlertController(title: "Error!!!", message: "Username field cannot be empty", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("the \"OK\" alert occured.")
      }))
      self.present(alert, animated: true, completion: nil)
      return
    }
    
    if (passwordCount == 0) {
      // show some alert  password count cannot be empty
      let alert = UIAlertController(title: "Error!!!", message: "Password cannot be empty", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured")
      }))
      self.present(alert, animated: true, completion: nil)
      return
    }
    
    //continue with happy path
    //call api (..please wait)
    //get and parse data (json serialization)
    //update UI 'login successful....'
    //load home/dashboard/ews/whatever screen
  }

}
