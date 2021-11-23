class Solution {
    func doOperation(_ stack: inout [Int], _ number: Int, _ operand: Character) {
        switch operand {
            case "+": stack.append(number)
            case "-": stack.append(-number)
            case "*": stack.append(stack.removeLast() * number)
            case "/": stack.append(stack.removeLast() / number)
            default: break
        }
    }
    
    func calculate(_ s: String) -> Int {
        let exp = Array(s.replacingOccurrences(of: " ", with: ""))
        var number = 0
        var operand = Character("+")
        var stack = [Int]()
        
        for char in exp {
            if char.isNumber {
                number = number * 10 + Int(String(char))!
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