func isValidBST(_ tree: TreeNode?) -> Bool {
    checkForValidBST(tree, Int.min, Int.max)
}


func checkForValidBST(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
    guard let root = root else { return true }
    
    if min >= root.val || max <= root.val {
        return false
    }
    
    let leftVal = root.left?.val ?? Int.min
    let rightVal = root.right?.val ?? Int.max
    
    let isValid = root.val < rightVal && root.val > leftVal
    
    return isValid
        && checkForValidBST(root.left, min, root.val)
        && checkForValidBST(root.right, root.val, max)
}
