    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var curr = head
        
        while curr != nil {
            if curr?.val == curr?.next?.val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
            
            
        }
        
        return head
    }