//
//  AppDelegate.swift
//  AdMobProject
//
//  Created by Oluwafemi Adenaike on 7/30/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import GoogleSignIn
import Foundation
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
  
  
  
  
  //ca-app-pub-1873465702732885~8085688280   Google Mobile Ads SDK guide
  //ca-app-pub-1873465702732885~8085688280 *Google Mobile Ads SDK guide
  //ca-app-pub-1873465702732885/9059024454   interstitial implementation guide
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    // Use Firebase library to configure APIs.
    FirebaseApp.configure()
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    //GoogleSignin
    GIDSignIn.sharedInstance().clientID = "1005223497960-qsitl8d9r1mg8d3q26v15a4cluq741j2.apps.googleusercontent.com"
    GIDSignIn.sharedInstance().delegate = self
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
  
  
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
     
      
      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
      let img = user.profile.imageURL(withDimension: 150)
      
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "signin"), object: nil, userInfo: ["user": user])
      
      
  }
  
  @available(iOS 9.0, *)
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
  }
  
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
  }
}

//ca-app-pub-1873465702732885~6913041568
//ca-app-pub-1873465702732885~6913041568
