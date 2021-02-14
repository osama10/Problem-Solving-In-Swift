//: [Previous](@previous)

import Foundation
// 160
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil { return nil }

    var a = headA
    var b = headB

    while a !== b {
        a = (a == nil) ? headB : a?.next
        b = (b == nil) ? headA : b?.next
    }

    return a
}


func getIntersectionNode1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

    var a = headA
    var b = headB

    while  a !== b {
        a = a == nil ? headB : a?.next
        b = b == nil ? headA : b?.next
    }

    return a

}
