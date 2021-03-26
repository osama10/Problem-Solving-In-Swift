/// 13

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
    let romanNumber = Array(s)
    var index = 0
    var result = 0

    while index < romanNumber.count {
        let currentNum = romanMapper(char: romanNumber[index])

        if (index < romanNumber.count - 1) {
            let nextNumber = romanMapper(char: romanNumber[index + 1])
            result += currentNum < nextNumber ? -currentNum : currentNum
        } else {
            result += currentNum
        }

        index += 1
    }

    return result
}
