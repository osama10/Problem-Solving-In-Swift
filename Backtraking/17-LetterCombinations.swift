// 17

func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }
    if digits.count == 1 { Array(digits) }
    
    let keypad : [String.Element: String ] = ["2" : "abc",
                  "3" : "def",
                  "4" : "ghi",
                  "5" : "jkl",
                  "6" : "mno",
                  "7" : "pqrs",
                  "8" : "tuv",
                  "9" : "wxyz"]

    var result = [String]()
    var combinations = [String]()
    for digit in digits { if let string = keypad[digit] { combinations.append(string) } }

    for char in combinations[0] {
        var partialResult = String(char)
        backtrack(1,combinations, partialResult: &partialResult, result: &result)
    }
    return result
}

func backtrack(_ index: Int, _ combinations: [String], partialResult: inout String, result: inout [String]) {
    if partialResult.count == combinations.count {
        result.append(partialResult)
    }else {
        for char in combinations[index] {
            partialResult.append(char)
            backtrack(index + 1,combinations, partialResult: &partialResult, result: &result)
            partialResult.removeLast()
        }
    }
}