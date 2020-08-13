//
//  PostViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
  
  @IBOutlet weak var postImageView: UIImageView!
  
  var imgpickimgController: UIImagePickerController?
  var postDelegate: PostDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addPostTitle()
  }
  
  func addPostTitle() {
    let title = UILabel()
    title.text = "Send Post"
    title.textColor = .black
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
    imgpickimgController = UIImagePickerController.init()
    imgpickimgController?.sourceType = .photoLibrary
    imgpickimgController?.delegate = self
    if let obj = imgpickimgController {
      present(obj, animated: true, completion: nil)
    }
  }
  
  @IBAction func uploadPost(_ sender: UIButton) {
    let image = postImageView.image
    PostManager.shared.uploadPostLC(postImage: image) {
      self.postDelegate?.reloadTable()
    }
    navigationController?.popViewController(animated: true)
  }
  
}

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    picker.dismiss(animated: true) {
      self.postImageView.image = img
    }
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    imgpickimgController?.dismiss(animated: true, completion: nil)
  }
}

protocol PostDelegate {
  func reloadTable()
}
