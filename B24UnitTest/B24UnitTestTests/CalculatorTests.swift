//
//  CalculatorTests.swift
//  B24UnitTestTests
//
//  Created by Oluwafemi Adenaike on 8/3/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest
@testable import B24UnitTest

class CalculatorTests: XCTestCase {

  var sut: Calculator! //system under test
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      sut = Calculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      sut = nil
    }

  func testAddition() {
    let res = sut.add(num1: 1, num2: 3)
    XCTAssertEqual(res, 4)
  }

  func testSubtract() {
    let res = sut.subtract(num1: 9, num2: 5)
    XCTAssertEqual(res, 4)
  }
  
  func testMultiply() {
    let res = sut.multiply(num1: 5, num2: 3)
    XCTAssertEqual(res, 15)
  }
  
  func testDivide() {
    let res = sut.divide(num1: 8, num2: 2)
    XCTAssertEqual(res, 4)
  }
}
