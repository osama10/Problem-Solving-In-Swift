func averageOfLevels(_ root: TreeNode?) -> [Double] {
    guard let root = root else { return [] }
    var queue = [TreeNode]()
    queue.append(root)
    var result = [Double]()
   
    
    while !queue.isEmpty {
        var newChildren = [TreeNode]()

        let count = queue.count
        var sum = 0
        
        for node in queue {
            sum += node.val
           
            if let leftChild = node.left {
                newChildren.append(leftChild)
            }
            
            if let rightChild = node.right {
                newChildren.append(rightChild)
            }
           
        }
        
        result.append(Double(sum)/Double(count))
        queue = newChildren
    }
    
    
    return result
}
