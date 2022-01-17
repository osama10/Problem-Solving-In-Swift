
class MaxStack {
    var stack = [Int]()
    var maxStack = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if let last = maxStack.last {
            maxStack.append(max(last, x))
        } else {
            maxStack.append(x)
        }
    }
    
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        stack.last!
    }
    
    func peekMax() -> Int {
        maxStack.last!
    }
    
    func popMax() -> Int {
        let maxNum = peekMax()
        var buffer = [Int]()
        
        while top() != maxNum {
            buffer.append(pop())
        }
        
        pop()
        
        while !buffer.isEmpty {
            push(buffer.removeLast())
        }
        
        return maxNum
    }
}