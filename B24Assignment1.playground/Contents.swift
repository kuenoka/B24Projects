import UIKit

func fibonacci(size: Int) -> [Int] {
  
  var output: [Int] = [0]
  let firstAdd = 1
  
  for i in 0..<size-1 {
    
    if output.count == 1 {
      output.append(output[i] + firstAdd)
    } else {
      output.append(output[i] + output[i-1])
    }
    
  }
  
  return output
  
}


let answer1 = fibonacci(size: 10)
//print(answer1)

func isItAPrimeNumber(number: Int) -> Bool {
  
  var outPut = true
  var checkingNumber = 2
  
  while checkingNumber <= number/2 && outPut == true {
    
    if (number % checkingNumber) == 0 {
      outPut = false
    } else {
      checkingNumber+=1
    }
    
  }
  
  return outPut
  
}

let answer2 = isItAPrimeNumber(number: 199)
//print(answer2)

func calculateFactorial(number: Int) -> Int {
  
  var output = 1
  
  if number > 2 {
    for i in 2...number {
      output*=i
    }
  } else {
    output = number
  }
  
  return output
  
}

let answer3 = calculateFactorial(number: 5)
print(answer3)
