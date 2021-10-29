class MyQueue {
    var newStack = [Int]()
    var oldStack = [Int]()
    init() {
        
    }
    
    func push(_ x: Int) {
        newStack.append(x)
    }
    
    func pop() -> Int {
        transferToOld()
        return oldStack.popLast() ?? -1
    }
    
    func peek() -> Int {
         transferToOld()
         return oldStack.last ?? -1
    }
    
    func empty() -> Bool {
         transferToOld()
         return oldStack.isEmpty
    }
    
    private func transferToOld() {
        if oldStack.isEmpty {
            while !newStack.isEmpty {
                oldStack.append(newStack.removeLast())
            }
        }
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */