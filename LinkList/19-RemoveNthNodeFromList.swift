class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var prev = head 
       
        var fast = head
        var slow = head 
        
        for _ in 1...n {
            fast = fast?.next
        }
        
        if fast == nil { return head?.next }
       
        while fast?.next != nil {  
            slow = slow?.next
            fast = fast?.next
        }
        
        slow?.next = slow?.next?.next
        
        return head
    }
}