import UIKit

var array = [-5, 2, 2, 3, 4, -7, -3, 120] // 121
var array2 = [-5, 1, 2, 3, 4, 5, 6, -10, -5, 100] // 106
var array3 = [1, 2, 3, 4, 5, 6, 7, 8] // 36
var array4 = [-5, 1, 2, 3, 4, -10] //10
var array5 = [-10, 2, 1, -1,-5] // 3

func calcLargConsSum(array: [Int]) -> Int {
  
  var solution = 0
  var currentSum = 0
  var usedArray = array
  
//  usedArray = removeFirstNegatives(array: usedArray)
//  usedArray = removeLastNegatives(array: usedArray)
  
  usedArray = shortArray(array: usedArray)
  
  solution = usedArray[0]
  //currentSum = usedArray[0]
  
  for i in 1..<usedArray.count {
    
    if usedArray[i] > 0 {
      currentSum += usedArray[i]
    } else if usedArray[i] < 0 {
      if (currentSum + usedArray[i]) > 0 {
        currentSum += usedArray[i]
      } else if (solution + usedArray[i]) < 0 {
        if solution < currentSum {
          solution = currentSum
        }
        currentSum = 0
      }
    }
    
  }
  
  if solution < currentSum {
    solution = currentSum
  }
  
  return solution
}

func removeFirstNegatives(array: [Int]) -> [Int] {
  var solution: [Int]  = array
  
  var firstPositive = false
  while !firstPositive {
    if solution[0] < 0 {
      solution.remove(at: 0)
    } else {
      firstPositive = true
    }
  }
  return solution
}

func removeLastNegatives(array: [Int]) -> [Int] {
  var solution: [Int]  = array
  
  var lastPositive = false
  while !lastPositive {
    if solution[solution.count-1] < 0 {
      solution.remove(at: solution.count-1)
    } else {
      lastPositive = true
    }
  }
  return solution
}

func shortArray (array: [Int]) -> [Int] {
  
  var solution: [Int] = []
  var positiveSum = 0
  var endPositiveSum = false
  var endOfNegativeSum = true
  var negativeSum = 0
  
  if array[0] < 0 {
    endPositiveSum = true
    endOfNegativeSum = false
  }
  
  for elements in array {
    
    if endOfNegativeSum {
      if elements > 0 {
        positiveSum += elements
      } else if elements < 0{
        solution.append(positiveSum)
        positiveSum = 0
        negativeSum += elements
        endPositiveSum = true
        endOfNegativeSum = false
      }
    } else if endPositiveSum {
      if elements < 0 {
        negativeSum += elements
      } else if elements > 0 {
        solution.append(negativeSum)
        negativeSum = 0
        positiveSum += elements
        endPositiveSum = false
        endOfNegativeSum = true
      }
    }
    
  }
  
  if positiveSum != 0 {
    solution.append(positiveSum)
  }
  if negativeSum != 0 {
    solution.append(negativeSum)
  }
  
  return solution
}

//var testArray = removeFirstNegatives(array: [-3,-5,-7,2,3,4])
//print(testArray)
//
//var testArray2 = removeLastNegatives(array: [2,3,4,-3,-5,-7])
//print(testArray2)

//var testArray3 = shortArray(array: [1,3,5,-4,-3,8,-9,19,4,-2,-3,8])
//print(testArray3)

var testArray4 = calcLargConsSum(array: array3)
print(testArray4)
