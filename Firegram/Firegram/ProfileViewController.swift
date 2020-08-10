//
//  ProfileViewController.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/9/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
//import FirebaseAuth
//import FirebaseDatabase

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var firstLastName: UILabel!
  @IBOutlet weak var followers: UILabel!
  @IBOutlet weak var following: UILabel!
  @IBOutlet weak var posts: UILabel!
  @IBOutlet weak var clkView: UICollectionView!
  @IBOutlet weak var profileImageView: UIImageView!
  
  var profile: Profile!
  var postArray: [Post] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    clkView.dataSource = self
    clkView.delegate = self
    addProfileTitle()
    signOut()
    editProfile()
    setup()
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
            let vc = sb.instantiateViewController(identifier: "EditProfileViewController")
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
      self.clkView.reloadData()
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
    dismiss(animated: true, completion: nil)
  }
  
  func editProfile() {
    let btn = UIBarButtonItem(title: "Edit Profile", style: .done, target: self, action: #selector(editAction))
    self.navigationItem.leftBarButtonItem = btn
  }
  
  @objc func editAction() {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "EditProfileViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
}

extension ProfileViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    postArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
    cell.post = postArray[indexPath.row]
    cell.getPost()
    return cell
  }
  
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 , height: collectionView.frame.height/4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
