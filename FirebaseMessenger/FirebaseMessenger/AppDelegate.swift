//
//  AppDelegate.swift
//  FirebaseMessenger
//
//  Created by Oluwafemi Adenaike on 8/2/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate /*, GIDSignInDelegate*/ {
  
  //var ref: DatabaseReference!
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    FirebaseApp.configure()
    GIDSignIn.sharedInstance().clientID = "674772584472-69aj697r90q9o100ttvfd2aea93vopa2.apps.googleusercontent.com"
    //ref = Database.database().reference()
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
  
//  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//    if let error = error {
//      if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//        print("The user has not signed in before or they have since signed out.")
//      } else {
//        print("\(error.localizedDescription)")
//      }
//      return
//    }
//
//    guard let authentication = user.authentication else { return }
//    let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
//                                                   accessToken: authentication.accessToken)
//    let uuid = UUID().uuidString
//    self.ref.child("users").child(user.userID).setValue(["Given Name": user.profile.givenName, "Last Name": user.profile.familyName, "Contact ID": uuid])
//    Auth.auth().signIn(with: credential) { (authResult, error) in
//      print("")
//      print("User is signed in")
//      print("")
//    }
//  }
  
//  @available(iOS 9.0, *)
//  func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
//    -> Bool {
//      return GIDSignIn.sharedInstance().handle(url)
//  }
//  
//  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//      return GIDSignIn.sharedInstance().handle(url)
//  }
}

