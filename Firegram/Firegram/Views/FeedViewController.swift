//
//  FeedViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
  
  @IBOutlet weak var tblView: UITableView!
  
  var postArray: [Post] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tblView.dataSource = self
    addFeedTitle()
    postAFeed()
//    setup()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setup()
  }
  
  func addFeedTitle() {
    let title = UILabel()
    title.text = "Feed"
    title.textColor = .black
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  func setup() {
    FeedManager.shared.getFollowing()
    FeedManager.shared.getPosts { (posts) in
      self.postArray = posts
      self.tblView.reloadData()
    }
  }
  
  func postAFeed() {
    let btn = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(postAction))
    navigationItem.rightBarButtonItem = btn
  }
  
  @objc func postAction() {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "PostViewController") as! PostViewController
    vc.postDelegate = self
    self.navigationController?.pushViewController(vc, animated: true)
  }
}

extension FeedViewController: UITableViewDataSource, PostDelegate, CommentDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return postArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FeedTableViewCell
    cell.likesLbl.text = "Liked By \(postArray[indexPath.row].likes)"
    cell.post = postArray[indexPath.row]
    cell.getPost()
    cell.delegate = self
    return cell
  }
  
  func reloadTable() {
    setup()
  }
  
  func moveToCommentViewController() {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "CommentViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
