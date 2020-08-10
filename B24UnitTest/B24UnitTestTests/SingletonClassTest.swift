//
//  SingletonClassTest.swift
//  B24UnitTestTests
//
//  Created by Oluwafemi Adenaike on 8/5/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest
@testable import B24UnitTest

class SingletonClassTest: XCTestCase {
  
  func testSingletonObject() {
    let obj = SingletonClass.shared
    let obj1 = SingletonClass.shared
    XCTAssertTrue(obj === obj1)
  }
  
  func testSingletonObjectWithDifferentInitialization() {
    let obj = SingletonClass.shared
    //let obj1 = SingletonClass()
    let obj1 = SingletonClass.shared
    XCTAssertTrue(obj === obj1)
  }
}
