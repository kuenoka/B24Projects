//
//  SearchManager.swift
//  Firegram
//
//  Created by Oluwafemi Adenaike on 8/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SearchManager {
  static let shared = SearchManager()
  private var searchRef = Database.database().reference().child("profiles")
  private var profiles: [Profile] = []
  
  func getProfiles(completion: @escaping ([Profile]) -> Void) {
    searchRef.observe(.value) { (snapshot) in
      let postDict = snapshot.value as? [String: AnyObject] ?? [:]
      self.arrangeData(postDict: postDict)
      DispatchQueue.main.async {
        completion(self.profiles)
      }
    }
  }
  
  private func arrangeData(postDict: [String: AnyObject]) {
    for profile in postDict.values {
      if let username = profile["username"], let firstname = profile["firstname"], let lastname = profile["lastname"], let followers = profile["followers"], let following = profile["following"], let posts = profile["posts"], let id = profile["id"] {
        let profileU = Profile(username: username as! String, firstname: firstname as! String, lastname: lastname as! String, followers: followers as! Int, following: following as! Int, posts: posts as! Int, id: id as! String)
        profiles.append(profileU)
      }
    }
  }
  
  func followProfile(profile: Profile) {
    let ref = Database.database().reference()
    let numberOfFollowers = profile.followers + 1
    ref.child("profiles/\(profile.id)/followers").setValue(numberOfFollowers)
    let myProfile = ProfileManager.shared.getMyProfile()
    let numberOfFollowing = myProfile.following + 1
    ref.child("profiles/\(myProfile.id)/following").setValue(numberOfFollowing)
    ref.child("following").child(myProfile.id).child(profile.id).setValue(["username": profile.username, "id": profile.id])
  }
  
  func unFollowProfile(profile: Profile) {
    let ref = Database.database().reference()
    let numberOfFollowers = profile.followers - 1
    ref.child("profiles/\(profile.id)/followers").setValue(numberOfFollowers)
    let myProfile = ProfileManager.shared.getMyProfile()
    let numberOfFollowing = myProfile.following - 1
    ref.child("profiles/\(myProfile.id)/following").setValue(numberOfFollowing)
    ref.child("following").child(myProfile.id).child(profile.id).removeValue()
  }
  
  private init() {}
}
