import UIKit

class Student {
  
  private var name: String
  private var major: String
  private var creditHours: Double
  
  init(name: String, major: String, creditHours: Double) {
    self.name = name
    self.major = major
    self.creditHours = creditHours
  }
  
  func getName() -> String {
    return self.name
  }
  
  func getMajor() -> String {
    return self.major
  }
  
  func getCreditHours() -> Double {
    return self.creditHours
  }
  
  func setName(name: String) {
    self.name = name
  }
  
  func setMajor(major: String) {
    self.major = major
  }
  
  func setCreditHours(creditHours: Double) {
    self.creditHours = creditHours
  }
}

let student = Student.init(name: "Kingsley Enoka", major: "Electrical Engr.", creditHours: 132.0)
var myName = student.getName()
var myMajor = student.getMajor()
var myCreditHours = student.getCreditHours()

print("Name: \(myName), Major: \(myMajor), Credit Hours: \(myCreditHours)")

student.setName(name: "Richard Enoka")
student.setMajor(major: "Computer Science")
student.setCreditHours(creditHours: 140.0)

myName = student.getName()
myMajor = student.getMajor()
myCreditHours = student.getCreditHours()

print("Name: \(myName), Major: \(myMajor), Credit Hours: \(myCreditHours)")


struct Animal {
  
  private var name: String = ""
  private var numberOfLimbs: Int = 0
  private var numberOfEyes: Int = 0
  
  func getName() -> String {
    return self.name
  }
  
  func getNumberOfLimbs() -> Int {
    return self.numberOfLimbs
  }
  
  func getNumberOfEyes() -> Int {
    return self.numberOfEyes
  }
  
  mutating func setName(name: String) {
    self.name = name
  }
  
  mutating func setNumberOfLimbs(numberOfLimbs: Int) {
    self.numberOfLimbs = numberOfLimbs
  }
  
  mutating func setNumberOfEyes(numberOfEyes: Int) {
    self.numberOfEyes = numberOfEyes
  }
}

var animal = Animal()

var name = animal.getName()
var numberOfLimbs = animal.getNumberOfLimbs()
var numberOfEyes = animal.getNumberOfEyes()

print("Name: \(name), Number Of Limbs: \(numberOfLimbs), Number Of Eyes: \(numberOfEyes)")

animal.setName(name: "Lion")
animal.setNumberOfEyes(numberOfEyes: 2)
animal.setNumberOfLimbs(numberOfLimbs: 4)

name = animal.getName()
numberOfLimbs = animal.getNumberOfLimbs()
numberOfEyes = animal.getNumberOfEyes()

print("Name: \(name), Number Of Limbs: \(numberOfLimbs), Number Of Eyes: \(numberOfEyes)")

