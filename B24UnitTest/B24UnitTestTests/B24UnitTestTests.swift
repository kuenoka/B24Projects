//
//  B24UnitTestTests.swift
//  B24UnitTestTests
//
//  Created by Oluwafemi Adenaike on 8/3/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest //TDD
@testable import B24UnitTest

class B24UnitTestTests: XCTestCase {

  var vc: ViewController!
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      vc = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      vc = nil
    }

  func testSimpleValues() {
    let value = 2
    let res = value + 2
    XCTAssertTrue(res == 4) //XCTAssert assert statement
  }
  
  func testSimpleValues2() {
    let value = 2
    let res = value + 3
    XCTAssertTrue(res == 5)
  }
}

//module ? framework

//access specifiers
// private, fileprivatr
