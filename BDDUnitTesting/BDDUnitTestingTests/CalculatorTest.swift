//
//  CalculatorTest.swift
//  BDDUnitTestingTests
//
//  Created by Oluwafemi Adenaike on 8/5/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Quick
import Nimble

@testable import BDDUnitTesting

class CalculatorTest: QuickSpec {

  override func spec() {
    var sut: Calculator!
    
    beforeEach {
      sut = Calculator()
    }
    
    afterEach {
      sut = nil
    }
    
    describe("calculator operations"){
      context("test add operation") {
        it("when two numbers are positive") {
          let result = sut.add(num1: 4, num2: 5)
          expect(result).to(equal(9))// only nimble code for pattern matching
        }
        it("when two numbers are negative") {
          let result = sut.add(num1: -4, num2: -5)
          expect(result).to(equal(-9))
        }
        it("when the smaller number is positive and the larger negative") {
          let result = sut.add(num1: 4, num2: -5)
          expect(result).to(equal(-1))
        }
        it("when the smaller number is negative and the larger positive") {
          let result = sut.add(num1: -4, num2: 5)
          expect(result).to(equal(1))
        }
      }
      
      context("test subtract operation") {
        it("when two numbers are positive") {
          let result = sut.subtract(num1: 6, num2: 4)
          expect(result).to(equal(2))// only nimble code for pattern matching
        }
        it("when two numbers are negative") {
          let result = sut.subtract(num1: -6, num2: -4)
          expect(result).to(equal(-2))
        }
        it("when the smaller number is positive and the larger negative") {
          let result = sut.subtract(num1: -6, num2: 4)
          expect(result).to(equal(-10))// only nimble code for pattern matching
        }
        it("when the smaller number is negative and the larger positive") {
          let result = sut.subtract(num1: 6, num2: -4)
          expect(result).to(equal(10))
        }
      }
      
      context("test multiply operation") {
        it("when two numbers are positive") {
          let result = sut.multiply(num1: 6, num2: 4)
          expect(result).to(equal(24))// only nimble code for pattern matching
        }
        it("when two numbers are negative") {
          let result = sut.multiply(num1: -6, num2: -4)
          expect(result).to(equal(24))
        }
        it("when the one number is negative") {
          let result = sut.multiply(num1: -6, num2: 4)
          expect(result).to(equal(-24))// only nimble code for pattern matching
        }
      }
      
      context("test divide operation") {
        it("when two numbers are positive") {
          let result = sut.divide(num1: 6, num2: 4)
          expect(result).to(equal(1))// only nimble code for pattern matching
        }
        it("when two numbers are negative") {
          let result = sut.divide(num1: -6, num2: -4)
          expect(result).to(equal(1))
        }
        it("when the one number is negative") {
          let result = sut.divide(num1: -6, num2: 4)
          expect(result).to(equal(-1))// only nimble code for pattern matching
        }
      }
    }
    
  }

}

//decribe: it decribes the higher functionality, which we write

//context:

//it:

//Gherkin:
//given
//when
//then
