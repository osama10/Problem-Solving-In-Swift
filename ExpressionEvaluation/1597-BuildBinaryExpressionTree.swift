public class Node {
    public var val: Character
    public var left: Node?
    public var right: Node?

    public init(_ val: Character) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Character, _ left: Node?, _ right: Node?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func operatorPrecedence(_ char: Character) -> Int {
    switch char {
    case "+", "-": return 1
    case "*", "/": return 2
    case "^": return 3
    default: return 0
    }
}

func infixToPostFix(_ expression: String) -> String {
    var stack = [Character]()
    var postfixExp = ""
    
    for char in expression {
        if char.isNumber || char.isLetter {
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

func expTree(_ expression: String) -> Node {
    var stack = [Node]()
    let expression = infixToPostFix(expression)
    
    for char in expression {
        if char.isNumber {
            stack.append(Node(char))
        } else {
            let b = stack.removeLast()
            let a = stack.removeLast()
            let operatorNode = Node(char, a, b)
            stack.append(operatorNode)
        }
    }
    
    return stack[0]
}

func levelOrderTraversal(_ root: Node?) -> [Character] {
    guard let root = root else { return [] }
    var queue = [root]
    var result = [Character]()
    
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let parent = queue.removeFirst()
            result.append(parent.val)
            guard let leftChild = parent.left,
                  let rightChild = parent.right
            else { continue }
            queue.append(leftChild)
            queue.append(rightChild)
        }
    }
    
    return result
}

levelOrderTraversal(expTree("1+2+3+4+5"))
