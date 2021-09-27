  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
       
        var l1 = l1
        var l2 = l2
        
        var carry = 0
        
        var dummyHead = ListNode(0)
        var result = dummyHead

        while l1 != nil || l2 != nil {
           
            let v1 = l1 == nil ? 0 : l1!.val
            let v2 = l2 == nil ? 0 : l2!.val
           
            let sum = v1 + v2 + carry
            carry = (sum / 10) 
            
            result.next = ListNode(sum % 10)
            result = (result.next)!
            
            
            l1 = l1?.next
            l2 = l2?.next
        }
        

        if carry > 0 {
             result.next = ListNode(carry)
             result = (result.next)!
        }
        
        return dummyHead.next
        
    }