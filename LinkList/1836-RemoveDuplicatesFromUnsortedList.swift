class Solution {
    func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
        var dict = [Int: Int]()
        var curr = head 
        
        var newHead: ListNode?
        var currOfNewList = newHead
        
        while curr != nil {
            dict[curr!.val, default: 0] += 1
            curr = curr?.next
        }
        
        curr = head
        
        while curr != nil {
            if dict[curr!.val] == 1 {
                if newHead == nil {
                    newHead = ListNode(curr!.val)
                    currOfNewList = newHead
                } else {
                    currOfNewList?.next = ListNode(curr!.val)
                    currOfNewList = currOfNewList?.next
                }
            }
            
            curr = curr?.next
        }
        
        return newHead
    }
}