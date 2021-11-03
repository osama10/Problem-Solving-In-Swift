class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        
        var fast = head
        var slow = head
        
        while (fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
            
            if fast === slow {
                return true
            }
        }
        
    
    return false
}
    
}