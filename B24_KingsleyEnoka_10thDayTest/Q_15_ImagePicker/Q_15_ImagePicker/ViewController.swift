//
//  ViewController.swift
//  Q_15_ImagePicker
//
//  Created by Oluwafemi Adenaike on 7/16/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var pickerImageView: UIImageView!
  
  var imagePickerController: UIImagePickerController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let gesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
    pickerImageView.addGestureRecognizer(gesture)
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    pickerImageView.image = info[UIImagePickerController.InfoKey(rawValue: "originalImage")] as? UIImage
    dismiss(animated: true) {}
  }
  
  @objc func pickImage() {
    imagePickerController = UIImagePickerController.init()
    imagePickerController?.sourceType = .photoLibrary
    imagePickerController?.delegate = self
    if let obj = imagePickerController {
      present(obj, animated: true, completion: nil)
    }
  }
}


