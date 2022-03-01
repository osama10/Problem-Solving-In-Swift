class DequeItem {
    public var prior: DequeItem?
    public var next: DequeItem?
    public var val: Int
    init(_ value: Int) {
        self.prior = nil
        self.next = nil
        self.val = value
    }
}

class Deque {
    private var first: DequeItem?
    private var last: DequeItem?
    
    init() {
        self.first = nil
        self.last = nil
    }
    
    func isEmpty() -> Bool {
        return first == nil
    }
    
    func peekFirst() -> Int {
        return first!.val
    }
    
    func peekLast() -> Int {
        return last!.val
    }
    
    func pollFirst() {
        if let first = self.first {
            if let prior = first.prior {
                prior.next = nil
                first.prior = nil
                self.first = prior
            } else {
                self.first = nil
                self.last = nil
            }
        }
    }
    
    func pollLast() {
        if let last = self.last {
            if let next = last.next {
                next.prior = nil
                last.next = nil
                self.last = next
            } else {
                self.first = nil
                self.last = nil
            }
        }
    }
    
    func offerFirst(_ num: Int) {
        let item = DequeItem(num)
        if let first = self.first {
            first.next = item
            item.prior = first
            self.first = item
        } else {
            self.first = item
            self.last = item
        }
    }
    
    func offerLast(_ num: Int) {
        let item = DequeItem(num)
        if let last = self.last {
            last.prior = item
            item.next = last
            self.last = item
        } else {
            self.first = item
            self.last = item
        }
    }
}
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 1 { return nums }
        var deque = Deque(), result = [Int]()
        
        for i in 0..<nums.count {
           
            while !deque.isEmpty() && deque.peekFirst() < i - k + 1 {
                deque.pollFirst()
            }
          
            while !deque.isEmpty() && nums[deque.peekLast()] < nums[i] {
                deque.pollLast()
            }
           
            deque.offerLast(i)
           
            if i >= k - 1 {
                result.append(nums[deque.peekFirst()])
            }
        }
        
        return result
    }
}