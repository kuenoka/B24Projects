//
//  AppDelegate.swift
//  B24Hello
//
//  Created by Oluwafemi Adenaike on 7/1/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

//class Blah {
//  var ijk = 10
//}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  //lazy var b = Blah.init()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
//    print(b.ijk)
//    print(b.ijk)
    
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


}

