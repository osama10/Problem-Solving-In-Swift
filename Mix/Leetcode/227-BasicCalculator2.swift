// 227 
func calculate(_ s: String) -> Int {
    let operation = Set("+*-/")
    var op : Character = "+"
    var number = 0
    var stack = [Int]()

    func doOperation() {
        if op == "+" { stack.append(number) }
        else if op == "-" { stack.append(-number) }
        else if op == "*" { stack.append(stack.removeLast() * number) }
        else { stack.append( stack.removeLast() / number) }
    }

    for char in s  {
        if char.isNumber { number = number * 10 + Int(String(char))! }
        else if operation.contains(char) {
            doOperation()
            op = char
            number = 0
        }
    }

    doOperation()
    return stack.reduce(0, +)
}
