import UIKit

/*********Q1******/
var testString = "hhehujjuuu"
func numberOfOcurrences(string: String) -> [(String, Int)] {
  
  var output: [(String, Int)] = []
  let array: [String] = getUniQueElement(string: string)
  var frequency: [Int] = []
  for element in array {
    frequency.append(getFrequency(string: element, fullString: string))
  }
  
  for i in 0..<array.count {
    output.append((array[i], frequency[i]))
  }
  return output
}

func getUniQueElement(string: String) -> [String]{
  
  var array: [String] = []
  for i in 0..<string.count {
    if !array.contains(String((Array(string))[i])) {
      array.append(String((Array(string))[i]))
    }
  }
  return array
}

func getFrequency(string: String, fullString: String) -> Int {
  var count = 0
  for element in fullString {
    if string == String(element) {
      count += 1
    }
  }
  return count
}
let result = numberOfOcurrences(string: testString)
print(result)
//numberOfOcurrences(string: "Paul")

/*********Q2******/
var testArray = [1,4,3,5,2,7]
func sortArray(array: [Int]) {
  
}

func placeValue() {
  
}

func check(array: [Int])-> Bool {
  
  var output = true
  for i in 1..<array.count {
    if (array[i-1] > array[i]) {
      output = false
    }
  }
  
  return output
}
/*********Q3******/
//Optionals are used to handle values that can be nil
//structures and classes can add extensions
//fast enumeration
//try/catch is used for error handling
//can return tuple

/*********Q4******/
//ViewCOntroller Lifecycle
/* ViewDidLoad: This is called first when the contentView is created. It is called only once */
/* ViewWillAppear: This is called after the content view has been created and is about to appear*/
/* ViewDidAppear: This is called when the content view appear in the app view hierachy*/
/* ViewWillDisppaer: This is called when the content view is about to leave the app's view hierachy*/
/* ViewDidDisappear: This is called when the content view has left the app's view hierachy*/

/*********Q5******/
//Diff btw class and struct
/* Classes are reference types while structs are value types*/
/* structs have a default init while classes dont have default init*/
/* classes can inherit from a parent class but structs cannot*/
/* classes can have class func but struct dont*/

/*********Q6******/
//Minimum Requirement for UITableView
/* D and E */

/*********Q7******/
let arrayOfTuple = [(3, "Dave"), (5, "Peter"), (4, "John")]

func splitArray(array: [(Int, String)]) -> ([Int], [String]) {
  var integerArray: [Int] = []
  var stringArray: [String] = []
  for element in array {
    integerArray.append(element.0)
    stringArray.append(element.1)
  }
  
  return (integerArray, stringArray)
}

splitArray(array: arrayOfTuple)

/*********Q8******/
//score1.score is 5 because structures are value types and they have their own space in memory so changing score 2 doesnot change score

/*********Q9******/
// 3 and 5

/*********Q10******/
// A. ? is the optional operator and is assigned to a value that can be nil
// B. ?? is the nil coalescing operator and is used to give a default value to an optional
// C. ! force unwrap is used to force unwrapp. It is used when the user is certain that the optioanl has a value
// D. ..< means a value will range from a certain number to less than a greater number
// E. ... means a value will reange from a certain number to another  number

/*********Q14******/
// Only a signle instance of UserDefault is needed. The string gotten from the userdefault didnot have to be force unwrapped(!) and the key should be diffrent from the value that gets assigned. The print statement is repetitive
// the correct syntax is:
//var name = UserDefault.standard.string(forkey: "name")
// print(myname)
