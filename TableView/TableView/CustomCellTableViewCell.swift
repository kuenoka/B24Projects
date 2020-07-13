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
  var closure: (()->())?
  
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
    delegate?.btnTapped()
  }
  
}
