class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil { return nil }
        
        var newHead = Node(-1)
        var copiedList: Node? = newHead 
        var cache = [Node: Node]()
        var curr = head
        
        while let oldNode = curr  {
            copiedList?.next = cache[oldNode] ?? Node(oldNode.val)
            copiedList = copiedList?.next
            cache[oldNode] = copiedList
            
            if let random = oldNode.random {
                copiedList?.random = cache[random]  ?? Node(random.val)
                cache[random] = copiedList?.random
            }
            
            curr = curr?.next
           
        }
        
        
        return newHead.next
    }
}