//
//  ViewControllerTest.swift
//  B24UnitTestTests
//
//  Created by Oluwafemi Adenaike on 8/3/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest
@testable import B24UnitTest

class ViewControllerTest: XCTestCase {
  
  var sut: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      let st = UIStoryboard(name: "Main", bundle: nil)
      sut = st.instantiateInitialViewController()
      _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      sut = nil
    }

  func testUpdateResultLabel() {
    sut.updateResult(value: 100)
    XCTAssertEqual(sut.resultLabel.text!, "100")
  }

  func testAdd() {
    //given
    sut.firstNumber.text = "2"
    sut.secondNumber.text = "3"
    
    //when
    sut.addButton(UIButton())
    
    //then
    XCTAssertEqual(sut.resultLabel.text!, "5")
  }
  
  func testSubtract() {
    sut.firstNumber.text = "6"
    sut.secondNumber.text = "2"
    sut.subtractButton(UIButton())
    XCTAssertEqual(sut.resultLabel.text, "4")
  }
  
  func testMultiply() {
    sut.firstNumber.text = "6"
    sut.secondNumber.text = "2"
    sut.multiplyButton(UIButton())
    XCTAssertEqual(sut.resultLabel.text, "12")
  }
  
  func testDivide() {
    sut.firstNumber.text = "6"
    sut.secondNumber.text = "2"
    sut.divideButton(UIButton())
    XCTAssertEqual(sut.resultLabel.text, "3")
  }
  
  func testFirstRetrieve() {
    sut.firstNumber.text = "2"
    let res = sut.retrieveNum1Int()
    XCTAssertEqual(res, 2)
  }
  
  func testSecondRetrieve() {
    sut.secondNumber.text = "2"
    let res = sut.retrieveNum2Int()
    XCTAssertEqual(res, 2)
  }
}
