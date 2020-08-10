//
//  SingletonClass.swift
//  B24UnitTest
//
//  Created by Oluwafemi Adenaike on 8/5/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation

class SingletonClass {
  static let shared = SingletonClass()
  private init() {}
}

//TDD vs BDD

//Test Driven Development (uses XCTest)
//Test Case First (fail)
//write/ complete code
//make test case eventually pass

// pure technical, you have to write all code
// if code is large, tdd helps you test all your code joins well with the main



//1000 files
//new feauture - new files



//behavior driven development
//first complet functionality
//then write test case

// easy to write test cases
// fast to complete test

//test cases are written in more of in an expressive natural language (english)
//non-tech person or project stake holder (PO/ BA) write empty tests

//project time is less

// Quick - writing test code
//Nimble = pattern matching xctasserttrue(value = 2)
