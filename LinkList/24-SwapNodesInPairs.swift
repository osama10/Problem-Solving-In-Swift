class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
		guard let head = head else { return head }
		let k = 2
		let dummy: ListNode? = ListNode(0, head)
		var before = dummy
		var count = nodeCount(head) / k

		while(count > 0) {
			let sublistTail = before?.next
			var prev: ListNode? = nil
			var current = sublistTail

			for _ in 0..<k {
				let next = current?.next
				current?.next = prev
				prev = current
				current = next

				if current == nil { break }
			}

			before?.next = prev
			sublistTail?.next = current

			before = sublistTail
			count -= 1
    }
    
    return dummy?.next
}

func nodeCount(_ head: ListNode?) -> Int {
    var curr = head
    var count = 0
   
    while curr != nil {
        count += 1
        curr = curr?.next
    }
    
    return count
}
}