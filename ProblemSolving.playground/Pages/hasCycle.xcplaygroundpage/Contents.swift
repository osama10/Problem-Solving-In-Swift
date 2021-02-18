//: [Previous](@previous)

import Foundation

// 141
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil { return false }
    var fast = head, slow = head
    while fast != nil  {
        fast = fast?.next?.next
        slow = slow?.next
        if fast === slow { return true }

    }
    return false
}

