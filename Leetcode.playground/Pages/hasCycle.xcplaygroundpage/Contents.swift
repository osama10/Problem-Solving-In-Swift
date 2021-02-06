//: [Previous](@previous)

import Foundation

// 141
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil { return false }

    var slow = head
    var fast = head?.next?.next

    while fast != nil {
        if slow === fast { return true }
        slow = slow?.next
        fast = fast?.next?.next
    }

    return false

}
