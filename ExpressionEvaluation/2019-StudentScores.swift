func doOperation(_ stack: inout [Int], _ number: Int, _ operand: Character) {
    switch operand {
    case "+": stack.append(number)
    case "*": stack.append(stack.removeLast() * number)
    default: fatalError("Operation doesnt exist")
    }
}

func evaluateExpression(_ expression: [Character]) -> Int {
    var stack = [Int]()
    var number = 0
    var operand = Character("+")
    
    for char in expression {
        if char.isNumber {
            number = 10 * number + Int(String(char))!
        } else {
            doOperation(&stack, number, operand)
            number = 0
            operand = char
        }
    }
    
    doOperation(&stack, number, operand)
    return stack.reduce(0, +)
}

private let operators: [Character: (Int, Int) -> Int] = [
    "+": { $0 + $1 },
    "-": { $0 - $1 },
    "*": { $0 * $1 }
]
    
var memo = [String: [Int]]()

func evaluateAllAnswers(_ expression: String) -> [Int] {
    
    if let answers = memo[expression] {
        return answers
    }
    
    if let number = Int(expression) {
        return [number]
    }
    
    var result = [Int]()
    
    for i in 0..<expression.count {
        let index = expression.index(expression.startIndex, offsetBy: i)
        let char = expression[index]
        
        if let operation = operators[char] {
            let leftVals = evaluateAllAnswers(String(expression[..<index]))
            let rightIndex = expression.index(after: index)
            let rightVals = evaluateAllAnswers(String(expression[rightIndex...]))
            
            for leftVal in leftVals {
                for rightVal in rightVals {
                    result.append(operation(leftVal, rightVal))
                }
            }
        }
    }
    
    return result
}

func scoreOfStudents(_ s: String, _ answers: [Int]) -> Int {
    let correctAnswer = evaluateExpression(Array(s))
    let possibleAnswers = Set(evaluateAllAnswers(s))
    var score = 0
    
    for answer in answers {
        if answer == correctAnswer {
            score += 5
        } else if possibleAnswers.contains(answer) {
            score += 2
        }
    }
    
    return score
}
