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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = reverseList(l1)
        var l2 = reverseList(l2)
        
        var carry = 0
        
        var resultHead = ListNode(-1)
        var result = resultHead
        
        while l1 != nil || l2 != nil {
            let sum1 = l1 == nil ? 0 : l1!.val
            let sum2 = l2 == nil ? 0 : l2!.val
            
            let val = (sum1 + sum2 + carry) % 10
            carry = (sum1 + sum2 + carry) / 10
            
            result.next = ListNode(val)
            
            l1 = l1?.next
            l2 = l2?.next
            result = result.next!
        }
        
        if carry == 1{
            result.next = ListNode(1)
        }
        
        return reverseList(resultHead.next)
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode?
        
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        return prev
    }
}