  func deleteNode(_ node: ListNode?) {
        var node = node
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }