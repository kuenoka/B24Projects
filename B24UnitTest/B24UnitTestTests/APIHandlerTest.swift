//
//  APIHandlerTest.swift
//  B24UnitTestTests
//
//  Created by Oluwafemi Adenaike on 8/4/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import XCTest
@testable import B24UnitTest

class MockSession: SessionProtocol {
  var isFetchDataCalled = false
  func fetchData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
    isFetchDataCalled = true
//    let data = "dummy response".data(using: .utf8)
    let todo = ToDoModel(userId: 1, id: 1, title: "hello", completed: false)
    let data = try? JSONEncoder().encode([todo])
    completion(data, nil, nil)
  }
  
}

class APIHandlerTest: XCTestCase {
  
  func testFetchToDoItems() {
    let expe = XCTestExpectation(description: "Testing To Do Item API call")
    let exp = expectation(description: "Testing To Do Item API call")
    let mockSession = MockSession()
    //let sut = APIHandler()
    let sut = APIHandler(session: mockSession)

    sut.fetchToDoItems{ (todos) in
      XCTAssertNotNil(todos)
      expe.fulfill()
    }

    XCTAssertTrue(mockSession.isFetchDataCalled)

    wait(for: [expe], timeout: 10)
  }
  
  func testFetchToDoItemsWithoutExpectation() {
      let mockSession = MockSession()
      let sut = APIHandler(session: mockSession)
  
      sut.fetchToDoItems{ (todos) in
        XCTAssertNotNil(todos)
      }
  
      XCTAssertTrue(mockSession.isFetchDataCalled)
  }

}

//class APIHandlerTest: XCTestCase {
//
//  func testFetchToDoItems() {
//    let expectation = XCTestExpectation(description: "Testing To Do Item API call")
//    let sut = APIHandler()
//
//    sut.fetchToDoItems{ (todos) in
//      XCTAssertNotNil(todos)
//      expectation.fulfill()
//
////      if todos == nil {
////        XCTFail()
////      } else {
////        expectation.fulfill()
////      }
//    }
//
//    wait(for: [expectation], timeout: 10)
//  }
//
//}
