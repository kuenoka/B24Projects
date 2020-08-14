//
//  ProfileViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/9/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var firstLastName: UILabel!
  @IBOutlet weak var followers: UILabel!
  @IBOutlet weak var following: UILabel!
  @IBOutlet weak var posts: UILabel!
  @IBOutlet weak var tblView: UITableView!
  @IBOutlet weak var profileImageView: UIImageView!
  
  var profile: Profile!
  var postArray: [Post] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    profileImageView.layer.cornerRadius = profileImageView.frame.height/2
    tblView.dataSource = self
    addProfileTitle()
    signOut()
    editProfile()
    setup()
  }
  
//  override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//    PostManager.shared.getPosts { (data) in
//      self.postArray = data
//      self.posts.text = "Posts: \(self.postArray.count)"
//      self.clkView.reloadData()
//    }
//  }
  
  
  @IBAction func likeByAction(_ sender: UITapGestureRecognizer) {
    print("")
    print("")
    print("")
    print("liked by tapped")
    print("")
    print("")
    print("")
  }
  
  func updateProfile(completion: @escaping (Bool) -> Void) {
    let alert = UIAlertController(title: "Update Profile", message: "Whats your first and last name?", preferredStyle: .alert)
    let update = UIAlertAction.init(title: "Update", style: .default) { (_) in
      completion(true)
      alert.dismiss(animated: true, completion: nil)
    }
    let action = UIAlertAction.init(title: "Cancel", style: .default) { (_) in
      completion(false)
      alert.dismiss(animated: true, completion: nil)
    }
    alert.addAction(update)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  func setup() {
    ProfileManager.shared.getProfile { (data) in
      self.profile = data
      self.firstLastName.text = self.profile.firstname + " " + self.profile.lastname
      self.following.text = "Following: \(self.profile.following)"
      self.followers.text = "Followers: \(self.profile.followers)"
      if self.firstLastName.text == " " {
        self.updateProfile { (value) in
          if value {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "EditProfileViewController") as! EditProfileViewController
            vc.editProfileDelegate = self
            self.navigationController?.pushViewController(vc, animated: true)
          }
        }
      }
    }
    ProfileManager.shared.getProfileImage{ (data) in
      self.profileImageView.image = data
    }
    PostManager.shared.getPosts { (data) in
      self.postArray = data
      self.posts.text = "Posts: \(self.postArray.count)"
      self.tblView.reloadData()
    }
  }
  
  func addProfileTitle() {
    let title = UILabel()
    title.text = "Profile"
    title.textColor = .black
    title.textAlignment = .center
    navigationItem.titleView = title
  }
  
  func signOut() {
    let btn = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOutAction))
    self.navigationItem.rightBarButtonItem = btn
  }
  
  @objc func signOutAction() {
    signOutProfile { (sign) in
      if sign {
        try! Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
      }
    }
  }
  
  func signOutProfile(completion: @escaping (Bool) -> Void) {
    let alert = UIAlertController(title: "Sign Out?", message: "Are you sure you want to sign out?", preferredStyle: .alert)
    let update = UIAlertAction.init(title: "Sign Out", style: .default) { (_) in
      completion(true)
      alert.dismiss(animated: true, completion: nil)
    }
    let action = UIAlertAction.init(title: "Cancel", style: .default) { (_) in
      completion(false)
      alert.dismiss(animated: true, completion: nil)
    }
    alert.addAction(update)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  func editProfile() {
    let btn = UIBarButtonItem(title: "Edit Profile", style: .done, target: self, action: #selector(editAction))
    self.navigationItem.leftBarButtonItem = btn
  }
  
  @objc func editAction() {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "EditProfileViewController") as! EditProfileViewController
    vc.editProfileDelegate = self
    navigationController?.pushViewController(vc, animated: true)
  }
  
}

extension ProfileViewController: UITableViewDataSource, CommentDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return postArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell
    cell.post = postArray[indexPath.row]
    cell.likedByLbl.text = "Liked By \(postArray[indexPath.row].likes)"
    cell.delegate = self
    cell.getPost()
    return cell
  }
  
  func moveToCommentViewController() {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "CommentViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension ProfileViewController: EditProfileDelegate {
  func editProfilePic() {
    ProfileManager.shared.getProfileImage{ (data) in
      self.profileImageView.image = data
    }
  }
}
