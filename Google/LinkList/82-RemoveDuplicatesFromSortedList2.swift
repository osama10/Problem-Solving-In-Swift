class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var sentinel: ListNode? = ListNode(0, head)
         var pred = sentinel
        var head = head
        
        while head != nil {
            if head?.next != nil && head?.val == head?.next?.val {
                
                while(head?.next != nil && head?.val == head?.next?.val) {
                    head = head?.next
                }
                
                pred?.next = head?.next
                
            } else {
                pred = pred?.next
            }
            
            head = head?.next
        }
        
        return sentinel?.next
    }
}