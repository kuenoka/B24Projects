//
//  CommentViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
  
  @IBOutlet weak var tblView: UITableView!
  @IBOutlet weak var commentTF: UITextField!
  var commentArray: [Comment] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    addCommentTitle()
    setup()
  }
  
  func setup() {
    CommentManager.shared.getComments{ (data) in
      self.commentArray = data
      self.tblView.reloadData()
    }
  }
  
  func addCommentTitle() {
    let title = UILabel()
    title.text = "Comment"
    title.textColor = .black
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  @IBAction func commentAction(_ sender: UIButton) {
    guard let comment = commentTF.text else { return }
    CommentManager.shared.makeComment(comment: comment)
  }
  
}

extension CommentViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return commentArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.text = commentArray[indexPath.row].comment
    cell.detailTextLabel?.text = commentArray[indexPath.row].senderusernmae + " " + commentArray[indexPath.row].date
    return cell
  }
  
  
}
