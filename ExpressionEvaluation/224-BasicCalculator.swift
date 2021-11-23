class Solution {
var index = 0
    
func calculate(_ s: String) -> Int {
    evaluateExpression(Array(s.replacingOccurrences(of: " ", with: "")))
}

func evaluateExpression(_ expression: [Character]) -> Int {
    guard index < expression.count else { return 0 }
    var number = 0
    var operand = 1
    var result = 0
    
    while index < expression.count {
        let char = expression[index]
        index += 1
        if char.isNumber {
            number = number * 10 + Int(String(char))!
        } else if char == "("{
            number = evaluateExpression(expression)
        } else if char == ")" {
            break
        } else {
            result += number * operand
            number = 0
            operand = char == "+" ? 1 : -1
        }
    }
    
    return result + (number * operand)
}
    
}