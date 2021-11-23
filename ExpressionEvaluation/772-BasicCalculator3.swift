class Solution {
    var index = 0
    
    func calculate(_ s: String) -> Int {
        let s = s.replacingOccurrences(of: " ", with: "")
        return evaluateExpression(Array(s))
    }
    
    func doOperation(_ stack: inout [Int], _ number: Int, _ operand: Character) {
        switch operand {
            case "+": stack.append(number)
            case "-": stack.append(-number)
            case "*": stack.append(stack.removeLast() * number)
            case "/": stack.append(stack.removeLast() / number)
            default: break
        }
    }
    
    func evaluateExpression(_ exp: [Character]) -> Int {
        var number = 0
        var operand = Character("+")
        var stack = [Int]()
        var result = 0
        
        while index < exp.count {
            let char = exp[index]
            index += 1
            if char.isNumber {
                number = number * 10 + Int(String(char))!
            } else if char == "(" {
                number = evaluateExpression(exp)
            } else if char == ")" {
                break
            } else {
                doOperation(&stack, number, operand)
                operand = char
                number = 0
            }
        }
        
        doOperation(&stack, number, operand)
        return stack.reduce(0, +)
    }
}