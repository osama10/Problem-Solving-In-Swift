//234 
func isPalindrome(_ head: ListNode?) -> Bool {
    var fast = head, slow = head

    while fast != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }

    fast = head
    slow = reverseList(slow)

    while slow != nil {
        if fast?.val != slow?.val { return false }
        slow = slow?.next
        fast = fast?.next
    }

    return true
}


func reverseList( _ head: ListNode?) -> ListNode? {
    var prev : ListNode? = nil
    var current = head

    while current != nil {
        let next = current?.next
        current?.next = prev
        prev = current
        current = next
    }

    return prev
}
