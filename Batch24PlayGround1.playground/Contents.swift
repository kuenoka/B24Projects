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
print(welcome)
