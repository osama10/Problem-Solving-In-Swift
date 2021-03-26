// 237
func deleteNode(_ node: ListNode?) {
     var head = node
     head?.val = head?.next?.val ?? 0
     head?.next = head?.next?.next
 }
