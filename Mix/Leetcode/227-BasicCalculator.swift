
// 227
func calculate(_ s: String) -> Int {
    let operations = Set("+-*/")
    var stack = [Int]()
    var lastNumber = 0
    var lastOp : Character = "+"

    func doOperations() {
        if lastOp == "+" { stack.append(lastNumber) }
        else if lastOp == "-" { stack.append(-lastNumber) }
        else if lastOp == "/" {
            let number = stack.removeLast()
            stack.append(number/lastNumber)
        } else {
            let number = stack.removeLast()
            stack.append(number * lastNumber)
        }
    }

    for char in s {
        if char.isNumber { lastNumber = ( lastNumber * 10 ) + Int(String(char))! }
        else if operations.contains(char) {
            doOperations()
            lastOp = char
            lastNumber = 0
        }
    }

    doOperations()
    return stack.reduce(0, +)
}

calculate("3/2")
