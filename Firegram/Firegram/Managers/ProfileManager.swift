//
//  ProfileManager.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/9/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class ProfileManager {
  
  static let shared = ProfileManager()
  private var profileRef: DatabaseReference!
  private var profileStoreRef: StorageReference!
  private var profile: Profile!
  
  func setID(id: String) {
    profileRef = Database.database().reference().child("profiles").child(id)
    profileStoreRef = Storage.storage().reference().child("profileImages").child(id)
  }
  
  func getProfile(completion: @escaping (Profile)-> Void) {
    profileRef.observe(.value) { (snapshot) in
      let postDic = snapshot.value as? [String : AnyObject ] ?? [:]
      
      self.arrangeData(postDict: postDic)
      DispatchQueue.main.async {
        completion(self.profile)
      }
    }
  }
  
  private func arrangeData(postDict: [String : AnyObject]) {
    if let username = postDict["username"], let firstname = postDict["firstname"], let lastname = postDict["lastname"], let followers = postDict["followers"], let following = postDict["following"], let posts = postDict["posts"], let id = postDict["id"] {
      profile = Profile(username: username as! String, firstname: firstname as! String, lastname: lastname as! String, followers: followers as! Int, following: following as! Int, posts: posts as! Int, id: id as! String)
    }
  }
  
  func saveFirstAndLastName(firstname: String, lastname: String, profileImage: UIImage?, completion: @escaping ()->Void) {
    let ref = Database.database().reference()
    ref.child("profiles/\(profile.id)/firstname").setValue(firstname)
    ref.child("profiles/\(profile.id)/lastname").setValue(lastname)
    guard let data = profileImage?.pngData() else { return }
    let uploadTask = profileStoreRef.putData(data, metadata: nil) { (metadata, error) in
      DispatchQueue.main.async {
        completion()
      }
    }
  }
  
  func getProfileImage(completion: @escaping (UIImage?) -> Void ) {
    profileStoreRef.getData(maxSize: 20 * 1024 * 1024) { data, error in
      guard let data = data else { return }
      if let error = error {
        print(error.localizedDescription)
      } else {
        let image = UIImage(data: data)
        DispatchQueue.main.async {
          completion(image)
        }
      }
    }
  }
  
  func getMyProfile() -> Profile {
    return profile
  }
  
  private init() {}
  
}
