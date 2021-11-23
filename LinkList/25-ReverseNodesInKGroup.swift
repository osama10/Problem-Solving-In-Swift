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
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let head = head, k > 1 else { return head }

    let dummy: ListNode? = ListNode(0, head)
    var before = dummy
    var count = nodeCount(head) / k
    
    while(count > 0) {
        let sublistTail = before?.next
        var prev: ListNode? = nil
        var current = sublistTail
        
        for _ in 0..<k {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
            
            if current == nil { break }
        }
        
        before?.next = prev
        sublistTail?.next = current
        
        before = sublistTail
        count -= 1
    }
    
    return dummy?.next
}

func nodeCount(_ head: ListNode?) -> Int {
    var curr = head
    var count = 0
   
    while curr != nil {
        count += 1
        curr = curr?.next
    }
    
    return count
}

}