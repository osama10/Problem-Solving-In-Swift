func connect(_ root: Node?) -> Node? {
    guard let root = root else { return root }
    var queue = [root]
    
    while !queue.isEmpty {
        var level = [Node]()
        var prevNode: Node?
        for node in queue {
            if prevNode != nil {
                prevNode?.next = node
            }
            prevNode = node
            
            if node.left != nil {
                level.append(node.left!)
            }
            
            if node.right != nil {
                level.append(node.right!)
            }
        }
                queue = level
    }
        
    return root
}
