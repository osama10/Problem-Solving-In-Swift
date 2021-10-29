class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var smallHead = ListNode(0)
        var currSmall = smallHead
        
        var bigHead = ListNode(0)
        var currBig = bigHead
        
        var curr = head
        
        while curr != nil {
            let newNode = ListNode(curr!.val)
            if curr!.val < x {
                currSmall.next  = newNode
                currSmall = (currSmall.next)!
            } else {
                currBig.next = newNode
                currBig = (currBig.next)!
            }
            
            curr = curr?.next
        }
        
        currBig.next = nil
        currSmall.next = bigHead.next
        
        
        return smallHead.next
    }
}