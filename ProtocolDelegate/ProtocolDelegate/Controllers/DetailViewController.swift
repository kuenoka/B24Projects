//
//  DetailViewController.swift
//  ProtocolDelegate
//
//  Created by Oluwafemi Adenaike on 7/17/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var lblView: UILabel!
  @IBOutlet weak var textField: UITextField!
  var detailViewControllerProtocol: DetailViewControllerProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    lblView.addBorder()
    showDefaultErrorAlert()
  }
  
  @IBAction func submitActionTabbed(sender: UIButton) {
    if let txtEntry = textField.text {
      detailViewControllerProtocol?.addEntry(entry: txtEntry)
      detailViewControllerProtocol?.reloadTableView()
    }
    navigationController?.popViewController(animated: true)
  }
}

extension UIView {
  
  func  addBorder( ) {
    self.layer.cornerRadius = 10
    self.layer.backgroundColor = UIColor.red.cgColor
  }
}

extension UIViewController {
  func showDefaultErrorAlert() {
    let a = UIAlertController.init(title: "error", message: "blah", preferredStyle: .alert)
    present(a, animated: true, completion: nil)
    let action = UIAlertAction(title: "ok", style: .default) { (_) in
      self.dismiss(animated: true, completion: nil)
    }
    a.addAction(action)
  }
}
