//
//  CustomCellTableViewCell.swift
//  TableView
//
//  Created by Oluwafemi Adenaike on 7/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

protocol CustomeCellTableViewProtocol {
  func btnTapped()
}

class CustomCellTableViewCell: UITableViewCell {

  var delegate: CustomeCellTableViewProtocol?
  
  var closure: ((Int)->(Bool))?
  
  var closure1: (()->())?

  var closure2: (()->(Bool))?
  var closure3: ((Int)->())?

  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  @IBOutlet weak var btnClk: UIButton!
  
  @IBAction func buttonClicked(_ sender: UIButton) {
    //closure?()
    let res = closure?(sender.tag)
    let res1 = closure1?()
    print(res, res1)
    delegate?.btnTapped()
  }
  
}
