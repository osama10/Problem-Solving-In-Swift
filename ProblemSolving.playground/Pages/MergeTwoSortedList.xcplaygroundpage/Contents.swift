import Foundation

/// 21
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    if l1 == nil { return l2 }
    if l2 == nil { return l1 }

    var linkList1 = l1
    var linkList2 = l2

    var currentMergeList: ListNode?
    var headOfMergedList: ListNode?

    while linkList1 != nil && linkList2 != nil {
        if linkList1!.val < linkList2!.val {
            if headOfMergedList == nil {
                headOfMergedList = linkList1
                currentMergeList = linkList1
            } else {
                currentMergeList?.next = linkList1
                currentMergeList = currentMergeList?.next
            }
            linkList1 = linkList1?.next
        } else {
            if headOfMergedList == nil {
                headOfMergedList = linkList2
                currentMergeList = linkList2
            } else {
                currentMergeList?.next = linkList2
                currentMergeList = currentMergeList?.next
            }
            linkList2 = linkList2?.next
        }
    }

    if linkList1 != nil {
        while linkList1 != nil {
            currentMergeList?.next = linkList1
            currentMergeList = currentMergeList?.next
            linkList1 = linkList1?.next
        }
    } else {
        while linkList2 != nil {
            currentMergeList?.next = linkList2
            currentMergeList = currentMergeList?.next
            linkList2 = linkList2?.next
        }
    }

    return headOfMergedList
}
