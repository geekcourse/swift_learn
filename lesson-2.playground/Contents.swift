import UIKit

//1
func isEven(number: Int)->Bool {
    if number % 2 == 0 {
        return true
    }
    return false
}

isEven(number: 4)
isEven(number: 5)

//2
func isDivideThree(number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    }
    return false
}

isDivideThree(number: 9)
isDivideThree(number: 10)

//3
var array100 : [Int] = []
for i in stride(from: 0, to: 10000, by: 23) {
    array100.append(i)
    if array100.count == 100 {
      break
    }
}

//4
for index in (0..<array100.count).reversed() {
    let item = array100[index]
    if isEven(number: item) || !isDivideThree(number: item) {
        array100.remove(at: index)
    }
}

//5
var fibonacci : [UInt64] = [0, 1, 1]
var i = 0
var last : UInt64
var prelast : UInt64
var newnumber : UInt64
while i < 50 {
    last = fibonacci.last!
    prelast = fibonacci[fibonacci.count-2]
    newnumber = last+prelast
    if (UINT64_MAX - newnumber) < last {
        print("На итерации \(i+1) будет переполнение целого числа")
        break
    }
    fibonacci.append(newnumber)
    i += 1
}

//6
var lastadded = 2
var simpleNumbers: [Int] = [lastadded]
var multipliersToCross: [Int]
var rownumber : [Int : Bool] = [:]
var min = lastadded
var max = 100

func fill_row(min: Int, max: Int) -> [Int : Bool]{
    for i in min...max {
        rownumber[i] = true
    }
    return rownumber
}

func cross_nums_in_row(min: Int, max: Int, rownumber: inout [Int : Bool], checkAllMultipliers: inout Bool)
{
    for i in min...max {
        if isEven(number: i) {
            rownumber[i] = nil
            continue
        }
        if checkAllMultipliers {
            for j in simpleNumbers {
                if j == 1 {
                    continue
                }
                if i % j == 0 {
                    rownumber[i] = nil
                }
            }
        } else {
            if i % simpleNumbers.last! == 0 {
                rownumber[i] = nil
            }
        }
    }
    checkAllMultipliers = false
}

var checkAllMultipliers = false
while simpleNumbers.count < 100 {
    if rownumber.count == 0 {
        rownumber = fill_row(min: min, max: max)
        checkAllMultipliers = true
    }
    cross_nums_in_row(min: min, max: max, rownumber: &rownumber, checkAllMultipliers: &checkAllMultipliers)
    for i in min...max {
        if (rownumber[i] != nil) {
            rownumber[i] = nil
            lastadded = i
            simpleNumbers.append(lastadded)
            break
        }
    }
    if rownumber.count == 0 {
        min = max + 1
        max += 100
    }
}


print("Первые 100 простых чисел: \n \(simpleNumbers)")
