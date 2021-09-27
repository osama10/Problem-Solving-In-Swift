class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil { return nil }
       var head = head
        var prev: ListNode?
        var curr = head 
        
        while curr != nil {
            if curr?.val == val {
                if prev == nil {
                    curr = curr?.next
                    head = curr

                } else {
                    prev?.next = curr?.next
                    curr = curr?.next
                }
                
            } else {
                prev = curr
                curr = curr?.next
            }
            
        }
        
        return head
    }
}