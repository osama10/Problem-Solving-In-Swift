    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        
        var fast = head 
        var slow = head
        var prev: ListNode? = nil
        
        while fast != nil && fast?.next != nil {
            prev = slow
            fast = fast?.next?.next
            slow = slow?.next
           
        }
       
        prev?.next = slow?.next
    
        return prev == nil ? nil : head
    }