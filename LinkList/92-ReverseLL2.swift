/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
       var dummy: ListNode? = ListNode(0, head)
      var before = dummy
        
        for _ in 0..<left - 1 {
            before = before?.next
        }
        
        var tailOfReversedLL = before?.next
        var prev = before?.next
        var curr = prev?.next
        
        for _ in 0..<(right-left) {
            let temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        
        before?.next = prev
        tailOfReversedLL?.next = curr
        
        return dummy?.next
    }
}