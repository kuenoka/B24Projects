//
//  ViewController.swift
//  AdMobProject
//
//  Created by Oluwafemi Adenaike on 7/30/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import GoogleMobileAds
import UIKit

class ViewController: UIViewController, GADInterstitialDelegate {
  
  var interstitial: GADInterstitial!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interstitial = createAndLoadInterstitial()
  }
  
  
  func createAndLoadInterstitial() -> GADInterstitial {
    let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    interstitial.delegate = self
    interstitial.load(GADRequest())
    return interstitial
  }
  
  func interstitialDidDismissScreen(_ ad: GADInterstitial) {
    interstitial = createAndLoadInterstitial()
  }
  
  @IBAction func displayad(_ sender: UIButton) {
    if interstitial.isReady {
      interstitial.present(fromRootViewController: self)
    } else {
      print("Ad wasn't ready")
    }
  }
  
  
  //      /// Tells the delegate an ad request succeeded.
  func interstitialDidReceiveAd(_ ad: GADInterstitial) {
    print("interstitialDidReceiveAd")
  }
  
  /// Tells the delegate an ad request failed.
  func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
    print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
  }
  
  /// Tells the delegate that an interstitial will be presented.
  func interstitialWillPresentScreen(_ ad: GADInterstitial) {
    print("interstitialWillPresentScreen")
  }
  
  /// Tells the delegate the interstitial is to be animated off the screen.
  func interstitialWillDismissScreen(_ ad: GADInterstitial) {
    print("interstitialWillDismissScreen")
  }
  
  /// Tells the delegate that a user click will open another app
  /// (such as the App Store), backgrounding the current app.
  func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
    print("interstitialWillLeaveApplication")
  }
}
