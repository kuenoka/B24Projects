//
//   UIButtonExtensions.swift
//  RXSwiftTableViewBindProject
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIButton {
  func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.98
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
  }
  func flash() {
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.duration = 0.3
    flash.fromValue = 1
    flash.toValue = 0.1
    flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    flash.autoreverses = true
    flash.repeatCount = 2
    layer.add(flash, forKey: nil)
  }
}

extension UIButton {
  
  func animateWhenPressed(disposeBag: DisposeBag) {
    let pressDownTransform = rx.controlEvent([.touchDown, .touchDragEnter])
      .map({ CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95) })
    
    let pressUpTransform = rx.controlEvent([.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
      .map({ CGAffineTransform.identity })
    
    Observable.merge(pressDownTransform, pressUpTransform)
      .distinctUntilChanged()
      .subscribe(onNext: animate(_:))
      .disposed(by: disposeBag)
  }
  
  private func animate(_ transform: CGAffineTransform) {
    UIView.animate(withDuration: 0.4,
                   delay: 0,
                   usingSpringWithDamping: 0.5,
                   initialSpringVelocity: 3,
                   options: [.curveEaseInOut],
                   animations: {
                    self.transform = transform
    }, completion: nil)
  }
  
}
