class Solution {
    func operations(_ token: String) -> (Int, Int) -> Int {
        switch token {
        case "+": return { $0 + $1 }
        case "-": return { $0 - $1 }
        case "*": return { $0 * $1 }
        case "/": return { $0 / $1 }
        default: fatalError("not possible")
        }
    }
    
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            if let number = Int(token) {
                stack.append(number)
            } else {
                let secondNum = stack.removeLast()
                let firstNum = stack.removeLast()
                let operation = operations(token)
                stack.append(operation(firstNum, secondNum))
            }
        }
        
        return stack.removeLast()
    }
}
