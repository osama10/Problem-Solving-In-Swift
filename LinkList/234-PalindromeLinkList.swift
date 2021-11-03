class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        slow = reverseLinkList(slow)
        fast = head
        
        while slow != nil {
            if fast?.val != slow?.val {
                return false
            }
            fast = fast?.next
            slow = slow?.next
        }
        
        return true
    }
    
    func reverseLinkList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var curr = head
        var prev: ListNode? = nil
        
        while curr != nil {
            let temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        
        return prev
    }
}