class BrowserHistory {
    var backStack = [String]()
    var forwardStack = [String]()
    
    init(_ homepage: String) {
        backStack.append(homepage)
    }
    
    func visit(_ url: String) {
        backStack.append(url)
        forwardStack = []
    }
    
    func back(_ steps: Int) -> String {
        var steps = steps

        while let curr = backStack.last, 
        steps > 0,
        backStack.count > 1 {
            forwardStack.append(curr)
            backStack.removeLast()
            steps -= 1
        }
        
        return  backStack.last!
    }
    
    func forward(_ steps: Int) -> String {
        guard !forwardStack.isEmpty else { return backStack.last! }
        
        var steps = steps

        while let curr = forwardStack.last, 
        steps > 0 {
            backStack.append(curr)
            forwardStack.removeLast()
            steps -= 1
        }
        
        return  backStack.last!
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */

