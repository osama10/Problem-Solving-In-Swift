class Solution {
    // sub problems would be N*(N + 1)/2
private let operators: [Character: (Int, Int) -> Int] = [
    "+": { $0 + $1 },
    "-": { $0 - $1 },
    "*": { $0 * $1 }
]
    
var memo = [String: [Int]]()

func diffWaysToCompute(_ expression: String) -> [Int] {
    if let result = memo[expression] {
        return result
    }
    
    if let num = Int(expression) {
        return [num]
    }
    
    var result = [Int]()
    
    for i in 0..<expression.count {
        let index = expression.index(expression.startIndex, offsetBy: i)
        let char = expression[index]
        
        if let operation = operators[char]  {
            let leftResult = diffWaysToCompute(String(expression[..<index]))
            let rightIndex = expression.index(after: index)
            let rightResult = diffWaysToCompute(String(expression[rightIndex...]))
            
            for leftVal in leftResult {
                for rightVal in rightResult {
                    result.append(operation(leftVal, rightVal))
                }
            }
        }
    }
    
    memo[expression] = result
    return result
}

}