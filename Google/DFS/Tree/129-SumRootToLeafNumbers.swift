   func sumNumbers(_ root: TreeNode?) -> Int {
    return sumNumbers(root, 0, 0)
}


func sumNumbers(_ root: TreeNode?, _ currNum: Int, _ total: Int) -> Int {
    guard let root = root else { return total }
    let currNum = currNum * 10 + root.val
    
    if root.left == nil && root.right == nil {
        return currNum + total
    }
    
    return total +  sumNumbers(root.left, currNum, total) +  sumNumbers(root.right, currNum, total)
}