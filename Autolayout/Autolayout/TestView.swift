//
//  TestView.swift
//  Autolayout
//
//  Created by Oluwafemi Adenaike on 7/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class TestView: UIView {

  @IBOutlet var contentView: UIView!
  @IBOutlet weak var mainLabel: UILabel!
  
  override init(frame: CGRect) { // for using CustomView in code
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    // we're going to do stuff here
    Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    //contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }
}
