//
//  ViewController.swift
//  Navigation
//
//  Created by Oluwafemi Adenaike on 7/8/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  var imgpickimgController: UIImagePickerController?
  
  @IBOutlet weak var myImageView: UIImageView!
  
  @IBOutlet weak var txtInput: UITextField!
  
  @IBOutlet weak var myLabel: UILabel!
  
  
  @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
    
     //if UIImagePickerController.isSourceTypeAvailable(.camera){ }
     imgpickimgController = UIImagePickerController.init()
    imgpickimgController?.sourceType = .photoLibrary
    imgpickimgController?.delegate = self
    if let obj = imgpickimgController {
      present(obj, animated: true, completion: nil)
    } else {
      
    }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    imgpickimgController?.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    picker.dismiss(animated: true) {
      self.myImageView.image = img
    }
  }
  
  var originalNumber = ""
  var finalNumber = "("
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.backgroundColor = .brown
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
    textField.backgroundColor = .white
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    hideKeyBoard()
    textField.text = finalNumber
    return true
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if string == "a" {
      //lb1 yo cannot enter string
      //label text color is redcolor
      myLabel.text = "You cannot enter a"
      let myColor : UIColor = UIColor.red
      txtInput.layer.borderColor = myColor.cgColor
      return false
    }
    if textField.text?.count == 3 {
      finalNumber += ")"
    }
    if textField.text?.count == 6 {
      finalNumber += "-"
    }
    finalNumber += string
    originalNumber += string
    //myCount += 1
    //print(string)
    
    myLabel.text = "Dont enter a"
    //label is default
    return true
  }
  @objc func hideKeyBoard() {
    txtInput.resignFirstResponder()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    txtInput.delegate = self
    let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
    view.addGestureRecognizer(gesture)
    view.backgroundColor = .green
    createRightButton ()
    
    let lb1 = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
    lb1.textAlignment = .center //for center alignment
    lb1.text = "title"
    lb1.textColor = .white
    lb1.backgroundColor = .lightGray // if required
    lb1.font = .systemFont(ofSize: 17)

    // To display multiple lines in label
    lb1.numberOfLines = 0 // if you want to display only 2 lines resplace 0 with 2
    lb1.lineBreakMode = .byWordWrapping // word wrap
    // OR
    lb1.lineBreakMode = .byCharWrapping // character wrap
    navigationItem.titleView = lb1
    
    let flagValue = UserDefaults.standard.bool(forKey: "flag")
    print("The flag value is \(flagValue)")
   createBackBarButton()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
//    let alert = UIAlertController.init(title: "Error", message: "Are you sure you want to quit", preferredStyle: .alert)
//    present(alert, animated: true, completion: nil)
//    let ok = UIAlertAction.init(title: "OK, quit :(", style: .default) { (_) in
//      alert.dismiss(animated: true, completion: nil)
//    }
//    let cancel = UIAlertAction.init(title: "Cancel", style: .default) { (_) in
//      alert.dismiss(animated: true, completion: nil)
//    }
//
//    alert.addAction(ok)
//    alert.addAction(cancel)
    
    
    let alert = UIAlertController.init(title: "Login", message: "Enter Username and Password", preferredStyle: .alert)
    alert.addTextField { (_) in
      alert.textFields?[0].text = "UserName: "
    }
    alert.addTextField { (_) in
      alert.textFields?[1].text = "Password: "
    }
    let ok = UIAlertAction.init(title: "OK, quit :(", style: .default) { (_) in
      if let userName = alert.textFields?[0].text {
        print(userName)
      }
      if let password = alert.textFields?[1].text {
        print(password)
      }
      alert.dismiss(animated: true, completion: nil)
    }
    alert.addAction(ok)
    present(alert, animated: true, completion: nil)
  }
  
  // back bar button item
  // alert with two textfields
  
  func createBackBarButton() {
    let bButton = UIBarButtonItem.init(title: "Barca", style: .done, target: self, action: #selector(backButton))
    navigationItem.backBarButtonItem = bButton
  }
  
  @objc func backButton() {
    navigationController?.popViewController(animated: true)
  }
  
  func createRightButton () {
    let rButton = UIBarButtonItem.init(title: "Open A", style: .done, target: self, action: #selector(openA(_:)))
    let rButton2 = UIBarButtonItem.init(title: "Open B", style: .done, target: self, action: #selector(openB))
    let rButtonModel = UIBarButtonItem.init(title: "pop up", style: .done, target: self, action: #selector(presentModule))
    //self.navigationItem.rightBarButtonItem = rButton
      self.navigationItem.rightBarButtonItems = [rButton, rButton2, rButtonModel]
  }

  @IBAction func openA(_ sender: UIButton) {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "AViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func openB() {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "BViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func presentModule() {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "BViewController")
    present(vc, animated: true) {
    }
  }
}

