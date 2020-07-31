//
//  DetailViewController.swift
//  CustomContact
//
//  Created by Oluwafemi Adenaike on 7/28/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

protocol DetailDelegate {
  func reloadTable()
}

class DetailViewController: UIViewController {
  
  @IBOutlet weak var firstNameTF: UITextField!
  @IBOutlet weak var lastNameTF: UITextField!
  @IBOutlet weak var companyTF: UITextField!
  var titleLabel = UILabel()
  
  var person: Person?
  var delegate: DetailDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    createTitleLabel()
    createDoneBtn()
    if let firstName = person?.firstName {
      firstNameTF.text = firstName
    }
    if let lastName = person?.lastName {
      lastNameTF.text = lastName
    }
    if let company = person?.company {
      companyTF.text = company
    }
  }
  
  func createTitleLabel() {
    titleLabel.text = "New Contact"
    titleLabel.textAlignment = .center
    titleLabel.textColor = .black
    titleLabel.font = .boldSystemFont(ofSize: 20)
    navigationItem.titleView = titleLabel
  }
  
  func createDoneBtn() {
    let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction))
    navigationItem.rightBarButtonItem = button
  }
  
  @objc func doneAction() {
    guard let firstName = firstNameTF.text,
    let lastName = lastNameTF.text,
      let company = companyTF.text else {
        return
    }
    if person != nil {
      person?.firstName = firstNameTF.text
      person?.lastName = lastNameTF.text
      person?.company = companyTF.text
      
      CoreDataManager.shared.saveContext()
    } else {
      CoreDataManager.shared.addNewContact(firstName: firstName, number: "888", email: "ku", company: company, lastName: lastName)
    }
    delegate?.reloadTable()
    navigationController?.popViewController(animated: true)
  }
  
}
