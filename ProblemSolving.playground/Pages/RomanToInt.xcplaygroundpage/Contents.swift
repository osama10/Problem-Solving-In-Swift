//: [Previous](@previous)

import Foundation

func romanMapper(char: Character) -> Int {
    switch char {
    case "I":
        return 1
    case "V":
        return 5
    case "X":
        return 10
    case "L":
        return 50
    case "C":
        return 100
    case "D":
        return 500
    case "M":
        return 1000
    default:
        return -1 // return error case
    }
}

func romanToInt(_ s: String) -> Int {
    var result = 0
    let romanNumber = Array(s)
    var index = 0

    while index < romanNumber.count {
        let value = romanMapper(char: romanNumber[index])

        if index + 1 < romanNumber.count {
            let nextValue = romanMapper(char: romanNumber[index + 1])
            if value >= nextValue {
                result += value
            } else {
                result += -value
            }
        } else {
            result += value
        }

        index += 1
    }

    return result
}

