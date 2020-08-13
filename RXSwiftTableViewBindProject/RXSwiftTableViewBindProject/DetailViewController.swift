//
//  DetailViewController.swift
//  RXSwiftTableViewBindProject
//
//  Created by Oluwafemi Adenaike on 8/13/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: UIViewController {
  
  
  @IBOutlet weak var tblView: UITableView!
  let disposeBag = DisposeBag()
  let viewModel = ViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpViewBindings()
    setUpSubscription()
  }
  
  func setUpViewBindings() {
    viewModel.dataSource.bind(to: self.tblView.rx.items) { (tableView, row, element) in
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
      cell.textLabel?.text = "\(element.title) @ row \(row)"
        return cell
    }
    .disposed(by: self.disposeBag)
  }
  
  func setUpSubscription() {
    callAPI(withUrlString: "https://jsonplaceholder.typicode.com/posts")
  }

  public func callAPI(withUrlString : String) {
    self.viewModel.callAPIFromViewModel(withUrlString: withUrlString)
    }
  
}
