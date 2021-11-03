class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}