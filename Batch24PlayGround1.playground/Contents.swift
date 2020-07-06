import UIKit

//let - immutable - u cannot mutate it

var a = 10 // type inference feauture make a of type integer
var a1: Int = 10
//a = "alok" //type safe

//Collection
//list/array

var b = [1,2,4,5]
var c: [Int] = [7,8,9,10]

var xyz: [Any] = ["alok", "35", true, 2.0]
let first1 = xyz[0] as! String //type casting
//print(first1)

let first2 = xyz[0] as? String
//print(first2)

//Number of ways to handle optionals
//optional binding
//optional chaining
//force unwrapping
//nil coalescing

// ! = force unwrap
// ? = optional - have a value or nil
// ?? nil coalescing

//optional data type
var m: Int? = 10//Int != Int?
var output = m ?? 3

var name: String? = "amit"
var unwrapped = name ?? ""

//set - unordered wheras array is ordered, set cannot have duplicate values whereas arrays can have duplicates

//dictionary

var movieDictionary: [String: String] = ["movieName": "MIB"]
movieDictionary["movieName"] = "LLB"

var aDictionary: [String: Any] = ["name": "alok", "age": 35, "hobby": "Gardening | Music"]
let aValue = aDictionary["name"]
//print(aValue)
let finalName = (aValue ?? "user") as? String
let welcome = "welcome " + (finalName ?? "John")
//print(welcome)

//array vs tuple
//tuple:

let tp = ("alok", true, 35) //declaration
//light weight - memory and init time data type for 'Passing Around Data'
//We can do same with array/dictionary/struct/class

func getDateMonthYear() -> (String, Int, Int) {
  
  let date = "10"
  let month = 7
  let year = 2020
  
  return (date, month, year)
  
}

let result = getDateMonthYear()
//print(result.0)
//print(result.1)
//print(result.2)

func getDateMonthYear1() -> (date:String, month:Int, year:Int) {
  
  let date = "10"
  let month = 7
  let year = 2020
  
  return (date, month, year)
  
}

let result1 = getDateMonthYear1()
//print(result1.date)
//print(result1.month)
//print(result1.year)
//print(result1.0 + "just appending to show problem")



func getDateMonthYear3() -> [Any] {
  
  let date = "10"
  let month = 7
  let year = 2020
  
  return [date, month, year]
  
}

let result3 = getDateMonthYear3()
//print(result3[0] as! String + "just appending to show problem") //see problem by uncommenting it

/*
 tuple preserve data type while array dont
 */

//in array u can iterate, append, insert, remove but not in tuple

//class - blueprint of object
//object - actual existence

class Stock {
  
  private var symbol: String = ""
  private var price: Float = 0.0
  
  func setSymbol(symbol: String) {
    self.symbol = symbol
  }
  
  func setPrice(price: Float) {
    self.price = price
  }
  
  func getSymbol() -> String {
    return self.symbol
  }
  
  func getPrice() -> Float {
    return self.price
  }
  
}

let stock = Stock() //heap
//stock.symbol = "apple" // wrong practice should use access identifiers // encapsulation
//stock.price = 700.0 // wrong pract

//use setters/getter

stock.setPrice(price: 700.0)
stock.setSymbol(symbol: "apple")

//print(stock.getPrice())
//print(stock.getSymbol())


/*************************************************************************************************************/


class Stock2 {
  
  private var symbol: String?
  private var price: Float?
  
  func setSymbol(symbol: String) {
    self.symbol = symbol
  }
  
  func setPrice(price: Float) {
    self.price = price
  }
  
  func getSymbol() -> String {
    return self.symbol ?? ""
  }
  
  func getPrice() -> Float {
    return self.price ?? 0.0
  }
  
}

/********************************************************************************************************/

//initializer class

class Stock3 {
  
  private var symbol: String
  private var price: Float
  
  init (symbol: String, price: Float){
    self.symbol = symbol
    self.price = price
  }
  
  func setSymbol(symbol: String) {
    self.symbol = symbol
  }
  
  func setPrice(price: Float) {
    self.price = price
  }
  
  func getSymbol() -> String {
    return self.symbol
  }
  
  func getPrice() -> Float {
    return self.price
  }
  
}

class Triangle {
  
  //let numberOfSides = 3 //always do this must not be var or optional
  var numberOfSides = 3
  let color: UIColor
  
  init ( color: UIColor, numberOfSides: Int) {
    self.color = color
    self.numberOfSides = numberOfSides
  }
  
}


/*************************************************************************************************/
//failable init

class Kite {
  
  var color: UIColor
  
  init?(color: UIColor) {
    self.color = color
    //try/catch
  }
}

let kite = Kite.init(color: UIColor.orange)

enum myAppErrors: Swift.Error {
  case error_open_db
}


class DataBaseHandler {
  
  var dbName:String
  
  init?(dbName: String){
    self.dbName = dbName
    
    if self.dbName.count > 0 {
      do {
        let res = try openDB()
      } catch {
        return nil
      }
    } else {
      return nil
    }
    
  }
  
  func openDB() throws {
    throw myAppErrors.error_open_db
  }
  
}

let obj = DataBaseHandler.init(dbName: "")
//print(obj?.dbName)

struct Person {
  var id: String
  
  init?(id:String) {
    if id.count == 9 {
      self.id = id
    } else {
      return nil
    }
  }
}

/********************************************************************************************/


class P1 {
  var name: String?
  
  static func hello () {
    
  }
  
  class func welcome () {
    
  }
}

let p1 = P1.init()
p1.name = "alok"

let p2 = p1
p2.name = "amit"

//print(p1.name)
//print(p2.name)

//pass by reference && pass by value

struct P2 {
  var name: String?
}

 var p3 = P2.init()
 p3.name = "alok"

 var p4 = p3
 p4.name = "amit"

 //print(p3.name)
// print(p4.name)

//struct do not follow inheritance
// you cannot modifiy properties in struct

struct P7 {
  
  var name: String?
  
  mutating func setName(name: String) {
    self.name = name
  }
  
  static func hello () {
    
  }
  
//  class func welcome () { // class func cannot be in a struct
//
//  }
//
}
P7.hello()

//very important static vs class methods
// class method can be overwritten and are for that class whereas static cannot be overwritten but can be used both in class and elsewhere


// struct init
struct Topic {
  var name: String
}

//struct have default init therefore you dont need an initializer whereas classes need initiliazer


//lazy prop is used when a property is ony initialized when its needed to save resources

class lazyExm {
  
  lazy var a = 10
  
  func getVal() -> Int {
    return a
  }
  
}

let obj111 = lazyExm()
//print(obj111.getVal())

//three types of property - stored, computed and lazy
//computer property is not stored in memory not sure
//stored property w and h

class Square {
  
  var w: Int = 10
  var h: Int = 20
  
  var area: Int { //computed property
    get {
      return w*h
    }
    set {
      w = Int(sqrt(Float(newValue)))
      h = w
    }
  }
  
  deinit {
    // remove observers
    // remove notifications
    // remove timers
  }
}

let s = Square.init()
s.w = 20
s.h = 20
//print(s.area)

s.area = 900
//print(s.w)
//print(s.h)

// enum is a collection of constants
//enums are value types
// enums have computed property (not stored property)

//Traditional enum
enum Direction {
  
  case East
  case West
  case North
  case South
  
}

class GeoLocation {
  
  var direction: Direction = Direction.East
  var lat = 11.0009
  var long = 12.875
  
}

let g = GeoLocation.init()
g.direction = .East
g.lat = 87.676

if g.direction == .East {
  
} else if g.direction == .West {
  
}


//raw value enum
enum Country: String {
  case India = "Famous for curry"
  case US = "Famous for start ups"
  case Brazil = "Famous for value"
}

//print(Country.India.rawValue)

// associated enum (optionals are associated enums)
enum Error {
  case info(String)
}

let en = Error.info("a generic error")

var k1 : String? = "10"
var k2 : Optional<String>

let someValue = 5
let someOptional: Int? = nil

switch someOptional {
case .some(someValue):
print("the value is \(someValue)")
case .some(let val):
print("the value is \(val)")
default:
print("nil")
}
//If you want match from someValue, using guard expression:

switch someValue {
case let val where val == someOptional:
print(someValue)
default:
break
}

// enums are used for having error states for your exception handling scenarios

//Producer of exception
//another code block is consumer

enum HeightErrors: Swift.Error {
  
  case less
  case more
  case not_suff_balance
}

class HeightChecker {
  
  func checkHeight(height: Float) throws -> Bool {
    
    if height > 170 {
      throw HeightErrors.more
    } else if height < 150 {
      throw HeightErrors.less
    } else {
      return true
    }
  }
}
//above part is the error throwing

let hcs = HeightChecker.init()

//error handling
do {
  let result = try hcs.checkHeight(height: 200)
} catch {
  print(error)
}

enum TransactionDetails: Swift.Error {
  
  case message(availableAmount: Float, succFailMessage: String)
}

//class Banking {
//
//  var availabeAmount: Float = 100
//
//  func withdrawAmount(amountToWithDraw: Float) throws -> TransactionDetails {
//
//    if amountToWithDraw < availabeAmount {
//
//      availabeAmount = availabeAmount - amountToWithDraw
//      return TransactionDetails.message(availableAmount: availabeAmount, succFailMessage: "Hey congrats! Successful withdrawal")
//
//    } else {
//
//      throw TransactionDetails.message(availableAmount: availabeAmount, succFailMessage: "Oops! Not sufficient balance")
//
//    }
//  }
//}

class Banking {

  var availabeAmount: Float = 100

  func withdrawAmount(amountToWithDraw: Float) throws -> (availableAmount: Float, succFailMessage: String) {

    if amountToWithDraw < availabeAmount {

      availabeAmount = availabeAmount - amountToWithDraw
      return (availableAmount: availabeAmount, succFailMessage: "Hey congrats! Successful withdrawal")

    } else {

      throw TransactionDetails.message(availableAmount: availabeAmount, succFailMessage: "Oops! Not sufficient balance")

    }
  }
}

let ba = Banking.init()

ba.availabeAmount = 200

do {
  let res = try ba.withdrawAmount(amountToWithDraw: 50)
  print(res)
} catch {
  print(error)
}

//let res = try? ba.withdrawAmount(amountToWithdraw: 50)
//let res = try! ba.withdrawAmount(amountToWithDraw: 50) // never use this way

class A {
  var x: Int
  
  init(x: Int) {
    self.x = x
  }
  
  deinit {
    //we will later write some
    
    //notification observer
    //timers
    //observers (KVO = key value observers)
    //print("object about to debinit")
  }
}

var obj1 : A? = A(x: 10)
obj1 = nil  //

let arr = [1, 2, 3, 4]
//for i = 0 . i <..; i ++     //not fast enumeration
//for each alsol
//arr.map

//let i = 0
//
//for i in arr {         //fast enumeration
//  print(i)
//}
//
//arr.forEach { (value) in
//  print(value)              //fast enumeration
//}

//arr.map ( {
//  print($0)                 //fast enumeration
//})

let res = arr.map({
  return $0 * $0
})
//print(res)

var aOptionalVar: String? = "Alok"
//welcome Alok

//optional binding if let
if let o = aOptionalVar {
  let res = "welcome" + o
  print(res)
} else {
  print("it is nil")
}

var aOptionalInt : Int? = 10
//increment by 10

if let o = aOptionalInt {
  let sum = 10 + o
  print(sum)
} else {
  print("it is nil")
}

//nil coalescing operator ??
let sum1 = (aOptionalInt ?? 0) + 10
//sum1 in case of var aOptionalInt : Int?, is equal to 0 + 10 = 10

//guard let
func encryptString(aOptionalString: String?) -> String {
  guard let constant = aOptionalString else {
    return ""
  }
  return "###S##########" + constant + "878768768&*$"
}

func checkHeight(height: Int) -> Bool {
  //guard else example
  guard height > 10 else {
    return false
  }
  return true
}

//guard else is not guard let


// optional chaining

class Address {
  var streetName: String? = "ADDC 12345"
}

class Person1 {
  var address: Address?
}
let per1 : Person1? = Person1.init()
let address: Address? = Address.init()
per1?.address = address

//print street name

let finalStreetname = per1?.address?.streetName // safest way // if any object in the chain is nil the chain will break
//print(finalStreetname ?? "nil")

// force unwrapping
var jk: Int?
//print(jk!)

if jk != nil {            // safely force unwrapping
  print(jk!)
}

let someString: String? = "red"
switch someString {
case "red":
    print("This is the color Red")
case "blue":
    print("This is the color Blue")
default:
    print("Some other color")
}

let pole: String
