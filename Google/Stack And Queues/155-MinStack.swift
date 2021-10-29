
class MinStack {
    var stack = [Int]()
    var minStack = [Int]()
    init() {
        
    }
    
    func push(_ val: Int) {
        stack.append(val)
        if let x = minStack.last {
            minStack.append( min(x, val) )
        } else {
            minStack.append(val)
        }

    }
    
    func pop() {
        stack.popLast()
        minStack.popLast()
    }
    
    func top() -> Int {
        stack.last ?? -1
    }
    
    func getMin() -> Int {
        minStack.last ?? -1
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */