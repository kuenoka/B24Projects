//
//  ToDoListViewControllerTest.swift
//  B24UnitTestTests
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest
@testable import B24UnitTest

class ToDoListViewControllerTest: XCTestCase {

  var sut: ToDoListViewController!
  
    override func setUpWithError() throws {
        let sb = UIStoryboard(name: "Main", bundle: nil)
      sut = sb.instantiateViewController(identifier: "ToDoListViewController")
      _ = sut.view
    }

    override func tearDownWithError() throws {
        sut = nil
    }

  func testNumberOfRowsInSection() {
    let testObj = [ToDoModel(userId: 1, id: 1, title: "hello", completed: false), ToDoModel(userId: 2, id: 1, title: "hello1", completed: false)]
    sut.items = testObj
    //let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
    //XCTAssertEqual(rows, 2)
  }

  func testDataSourceDelegate() {
    XCTAssertNotNil(sut.toDoTableView.dataSource)
    XCTAssertNotNil(sut.toDoTableView.delegate)
  }
}
