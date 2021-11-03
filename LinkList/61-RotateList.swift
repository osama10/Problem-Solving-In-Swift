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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }
        let k = k % count(head) // get total nodes
        
        if k == 0 { return head } // no need to swap
        
        var fast = head
        var slow = head 
		
        // Move fast to k  node from distance
        for _ in 1...k {
            fast = fast?.next
        }
        
	// Move slow to k - 1 node from distance
	 while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        var newTail = slow
        var newHead = slow?.next
        newTail?.next = nil
        
        var curr = newHead 
        
		// find last node in the original head
        while curr?.next != nil {
            curr = curr?.next
        }
        
        curr?.next = head // connect head to the last node
        
        return newHead
    }
    
    func count(_ head: ListNode?) -> Int {
        if head == nil { return 0 }
        var count = 0 
        var curr = head 
        
        while curr != nil {
            count += 1
            curr = curr?.next
        }
        
        return count
    }
}