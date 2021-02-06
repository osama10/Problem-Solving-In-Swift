import Foundation

/// 155 https://leetcode.com/problems/min-stack/


class MinStack {
    var array: [Int]
    var minStack: [Int]
    /** initialize your data structure here. */
    init() {
         array = []
         minStack = []
    }

    func push(_ x: Int) {
        array.append(x)
        guard let y = minStack.last else {
            minStack.append(x)
            return
        }
        minStack.append( y < x ? y : x)
    }

    func pop() {
        array.popLast()
        minStack.popLast()
    }

    func top() -> Int { return array.last! }

    func getMin() -> Int {
        return minStack.last!
    }
}

let min = MinStack()
min.push(0)
min.push(1)
min.push(0)

min.getMin()
min.pop()
