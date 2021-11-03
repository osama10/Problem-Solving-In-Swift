 func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
         guard let root = root else { return [] }
    var queue = [TreeNode]()
    queue.append(root)
    var result = [[Int]]()
       
    while !queue.isEmpty {
        var newChildren = [TreeNode]()
        var level = [Int]()
        
        for node in queue {
            level.append(node.val)
           
           if let leftChild = node.left {
                    newChildren.append(leftChild)
                }
                
                if let rightChild = node.right {
                    newChildren.append(rightChild)
                }
        }
        
        result.append(level)
        queue = newChildren
    }
    
    for level in 0..<result.count {
        if level % 2 != 0 {
            result[level].reverse()
        }
    }
        
    return result
    }