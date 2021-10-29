class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        let mid = getMid(head)
        let left = sortList(head)
        let right = sortList(mid)
        
        return mergeTwoLists(left, right)
    }
    
    func getMid(_ head: ListNode?) -> ListNode? {
        var midPrev: ListNode?
        var head = head
        
        while(head != nil && head?.next != nil) {
            midPrev = midPrev == nil ? head : midPrev?.next
            head = head?.next?.next
        }
        
        let mid = midPrev?.next 
        midPrev?.next = nil
        return mid
        
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var l1 = l1
        var l2 = l2 
        
        var dummyHead = ListNode(0)
        var dummy = dummyHead

        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                dummy.next = ListNode(l1!.val)
                l1 = l1?.next
            } else {
                dummy.next = ListNode(l2!.val)
                l2 = l2?.next
            }
            
            
            dummy = (dummy.next)!
        }
        
        dummy.next = l1 == nil ? l2 : l1

        return dummyHead.next
    }
}