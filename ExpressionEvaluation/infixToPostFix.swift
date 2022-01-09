func operatorPrecedence(_ char: String) -> Int {
    switch char {
    case "+", "-": return 1
    case "*", "/": return 2
    case "^": return 3
    default: return 0
    }
}

func infixToPostFix(_ expression: String) -> [String] {
    var stack = [String]()
    var postfixExp = [String]()
    let expression = expression
        .split(separator: " ")
        .map(String.init)
    
    for char in expression {
        if Int(char) != nil {
            postfixExp.append(char)
        } else if char == "(" {
            stack.append("(")
        } else if char == ")" {
            while !stack.isEmpty, let char = stack.last, char != "(" {
                postfixExp.append(stack.removeLast())
            }
            stack.removeLast()
        } else {
            while !stack.isEmpty,
                    let last = stack.last,
                  operatorPrecedence(char) <= operatorPrecedence(last) {
                postfixExp.append(last)
                stack.removeLast()
            }
            
            stack.append(char)
        }
    }
    
    while !stack.isEmpty {
        postfixExp.append(stack.removeLast())
    }
    
    return postfixExp
}

infixToPostFix("( 4 + ( 13 / 5 ) )")
infixToPostFix("( ( 10 * ( 6 / ( ( 9 + 3 ) * -11 ) ) ) + 17 ) + 5")
