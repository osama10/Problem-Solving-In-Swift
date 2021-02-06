import Foundation

// 234
func isPalindrome(_ head: ListNode?) -> Bool {
    var fast = head
    var slow = head

    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }

    if fast != nil { slow = slow?.next }

    slow = reverse(slow)
    fast = head

    while slow != nil {
        if fast?.val != slow?.val { return false }
        slow = slow?.next
        fast = fast?.next
    }

    return true
}

func reverse(_ node: ListNode?) -> ListNode? {
    var current = node
    var prev: ListNode? = nil

    while current != nil {
        let next = current?.next
        current?.next = prev
        prev = current
        current = next
    }

    return prev
}
