let numberMaps: [Character: String] = [
    "2": "abc",
    "3": "def",
    "4": "ghi",
    "5": "jkl",
    "6": "mno",
    "7": "pqrs",
    "8": "tuv",
    "9": "wxyz"
]

func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else { return [] }
    let digits = Array(digits)

    var result = [String]()
    
    
    numberMaps[digits[0]]!.forEach { char in
        let combination = String(char)
        genrateCombinations(combination,
                            digits,
                            1,
                            &result)
    }
    
    return result
    
}


func genrateCombinations(_ combination: String,
                       _ digit: [Character],
                       _ next: Int,
                       _ allCombinations: inout [String]) {
    if combination.count == digit.count {
        allCombinations.append(combination)
    } else {
        numberMaps[digit[next]]!.forEach { char in
            genrateCombinations(combination + String(char),
                                digit,
                                next + 1,
                                &allCombinations)
        }
    }
}
