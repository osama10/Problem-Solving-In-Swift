// https://www.geeksforgeeks.org/sort-stack-using-temporary-stack/

func sortedStack(_ stack: [Int]) -> [Int] {
    var stack = stack
    var sortedStack = [Int]()
    
    while !stack.isEmpty {
        let num = stack.removeLast()
        while !sortedStack.isEmpty && sortedStack.last! > num {
            let sortedNum = sortedStack.removeLast()
            stack.append(sortedNum)
        }
        sortedStack.append(num)
    }
    
    return sortedStack
}