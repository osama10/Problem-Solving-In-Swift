//: [Previous](@previous)

import Foundation
/// 21
func mergeLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

    if list1 == nil { return list2 }
    if list2 == nil { return list1 }

    let dummyNode = ListNode(0)
    var tail: ListNode? = dummyNode

    var list1 = list1
    var list2 = list2

    while list1 != nil && list2 != nil {

        if list1!.val < list2!.val {
            tail?.next = list1
            list1 = list1?.next
        } else {
            tail?.next = list2
            list2 = list2?.next
        }

        tail = tail?.next
    }

    tail?.next = list1 != nil ? list1 : list2

    return dummyNode.next
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }

    var temp : ListNode? = nil

    if l1!.val < l2!.val {
        temp = l1
        temp?.next = mergeTwoLists(l1?.next, l2)
    }else {
        temp = l2
        temp?.next = mergeTwoLists(l1, l2?.next)
    }

    return temp
}



