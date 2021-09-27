class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var ptr1 = intersection(head)
        
        if ptr1 == nil { return nil }
        
        var ptr2: ListNode? = head
        
        while ptr1 !== ptr2 {
            ptr1 = ptr1?.next
            ptr2 = ptr2?.next
        }
        
        return ptr1
    }
    
    func intersection(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        
        while (fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
            
            if fast === slow {
                return fast
            }
        }
        
        return nil
    }
}