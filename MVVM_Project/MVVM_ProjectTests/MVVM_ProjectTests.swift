//
//  MVVM_ProjectTests.swift
//  MVVM_ProjectTests
//
//  Created by Oluwafemi Adenaike on 8/7/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest
@testable import MVVM_Project

class MVVM_ProjectTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testViewModelNotNil() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let vm = ViewModel()
    XCTAssertNotNil(vm, "vm must not be nil")
  }
  
  func testGetRows() {
    let vm = ViewModel()
    let nOfRows = vm.getRows()
    XCTAssertEqual(nOfRows, 0)
  }
  
  func testGetObj() {
    let vm = ViewModel()
    let model = vm.getObject(index: 0)
    XCTAssertEqual(model.title, "")
  }
}
