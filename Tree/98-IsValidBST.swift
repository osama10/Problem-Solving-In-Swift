/// 98 

func isValidBST(_ root: TreeNode?) -> Bool {
    return isValidBST(root, nil, nil)
}


func isValidBST(_ root: TreeNode?, _ max: Int?, _ min : Int?) -> Bool {
    guard let root = root else { return true }
    let isValid = ( max == nil || max! > root.val ) && ( min == nil || min! < root.val )
    return isValid && isValidBST(root.left,  root.val,  min) && isValidBST(root.right,  max,  root.val)
}
