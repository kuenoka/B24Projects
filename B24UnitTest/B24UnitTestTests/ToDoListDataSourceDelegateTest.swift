//
//  ToDoListDataSourceDelegateTest.swift
//  B24UnitTestTests
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest
@testable import  B24UnitTest

class MockToDoListViewController: UIViewController, ToDoDelegate {
  var isDidSelectCalled = false
  func didSelect(index: Int) {
    isDidSelectCalled = true
  }
}

class ToDoListDataSourceDelegateTest: XCTestCase {
  
  var sut: ToDoListDataSourceDelegate!
  let mocViewController = MockToDoListViewController()

    override func setUpWithError() throws {
       sut = ToDoListDataSourceDelegate()
      mocViewController.beginAppearanceTransition(true, animated: true)
    }

    override func tearDownWithError() throws {
        sut = nil
      mocViewController.endAppearanceTransition()
    }

  func testNumberOfSection() {
    let sections = sut.numberOfSections(in: UITableView())
    XCTAssertEqual(sections, 1)
  }
  
  func testNumberOfRowsInSection() {
    let testObj = [ToDoModel(userId: 1, id: 1, title: "hello", completed: false), ToDoModel(userId: 2, id: 1, title: "hello1", completed: false)]
    sut.items = testObj
    let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
    XCTAssertEqual(rows, 2)
  }
  
  func testDidSelectRowAt() {
    let testObj = [ToDoModel(userId: 1, id: 1, title: "hello", completed: false), ToDoModel(userId: 2, id: 1, title: "hello1", completed: false)]
    sut.items = testObj
    
    sut.delegate = mocViewController
    
    sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
    
    XCTAssertTrue(mocViewController.isDidSelectCalled)
  }
  
  func testCellForRowAt() {
    let testObj = [ToDoModel(userId: 1, id: 1, title: "hello", completed: false), ToDoModel(userId: 2, id: 1, title: "hello1", completed: false)]
    sut.items = testObj
    let table = UITableView()
    sut.delegate = mocViewController
    table.dataSource = sut
    table.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoCell")
    let cell = sut.tableView(table, cellForRowAt: IndexPath(row: 0, section: 0))
    XCTAssertEqual(cell.detailTextLabel?.text, "hello")
  }
}
