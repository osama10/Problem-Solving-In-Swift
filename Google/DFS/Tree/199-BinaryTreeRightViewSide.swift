/* func rightSideView(_ root: TreeNode?) -> [Int] {
    var rightSideVal = [Int]()
    var dict = [Int: Int]()
    rightSideView(root, &rightSideVal, &dict, 0)
    return rightSideVal
}

func rightSideView(_ root: TreeNode?, _ result: inout [Int], _ dict: inout [Int: Int], _ level: Int)  {
    guard let root = root else { return }
    let level = level + 1
   
    if dict[level] == nil {
        result.append(root.val)
        dict[level] = root.val
    }
    
    rightSideView(root.right, &result, &dict, level)
    rightSideView(root.left, &result, &dict, level)
    
}
*/

func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var result = [Int]()
    var queue = [root]
    
    while !queue.isEmpty {
        let lastIndex = queue.count - 1
        
        for indx in 0...lastIndex {
            let node = queue.removeFirst()
            if lastIndex == indx {
                result.append(node.val)
            }
    
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
        
    }
    
    return result
}