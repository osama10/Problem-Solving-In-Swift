func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var depth = 0
    var queue = [root]
    
    while !queue.isEmpty {
        var level = [TreeNode]()
        depth += 1
        
        for node in queue {
            if node.left == nil && node.right == nil {
                return depth
            }
         
            if let leftChild = node.left {
                level.append(leftChild)

            }
            
            if let rightChild = node.right {
                level.append(rightChild)
            }
            
        }
        queue = level
    }
    
    return depth
    
}
