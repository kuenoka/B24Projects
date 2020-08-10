//
//  EditProfileViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/9/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
  
  @IBOutlet weak var firstname: UITextField!
  @IBOutlet weak var lastname: UITextField!
  @IBOutlet weak var profileImageView: UIImageView!
  
  var imgpickimgController: UIImagePickerController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addEditTitle()
    setup()
  }
  
  func addEditTitle() {
    let title = UILabel()
    title.text = "Edit Profile"
    title.textColor = .black
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  @IBAction func save(_ sender: UIButton) {
    guard let firstName = firstname.text, let lastName = lastname.text else { return }
    let image = profileImageView.image
    ProfileManager.shared.saveFirstAndLastName(firstname: firstName, lastname: lastName, profileImage: image)
  }
  
  
  @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
    imgpickimgController = UIImagePickerController.init()
    imgpickimgController?.sourceType = .photoLibrary
    imgpickimgController?.delegate = self
    if let obj = imgpickimgController {
      present(obj, animated: true, completion: nil)
    }
  }
  
  
  func setup() {
    ProfileManager.shared.getProfile { (data) in
      self.firstname.text = data.firstname
      self.lastname.text = data.lastname
    }
    ProfileManager.shared.getProfileImage{ (data) in
      self.profileImageView.image = data
    }
  }
  
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    picker.dismiss(animated: true) {
      self.profileImageView.image = img
    }
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    imgpickimgController?.dismiss(animated: true, completion: nil)
  }
}
