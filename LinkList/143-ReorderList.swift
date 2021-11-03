class Solution {
    func reorderList(_ head: ListNode?) {
        var node = head, stack = [node]
        while let next = node?.next {
            stack.append(next)
            node = next
        }
        
        node = head
        while let next = node?.next, let endNode = stack.removeLast() {
            
            node?.next = endNode
            endNode.next = next
            
            node = next
            
            if node?.next === endNode {
                node?.next = nil
                break
            }
        }
    }
}



