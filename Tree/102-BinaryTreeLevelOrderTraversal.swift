   /// 102 
   func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var queue = [root]
    var result = [[Int]]()

    while !queue.isEmpty {
        var level = [Int]()
        var newNodes = [TreeNode]()
        for node in queue {
            level.append(node.val)
            if let leftNode = node.left { newNodes.append(leftNode) }
            if let rigtNode = node.right { newNodes.append(rigtNode) }
        }
        result.append(level)
        queue = newNodes
    }

    return result
}