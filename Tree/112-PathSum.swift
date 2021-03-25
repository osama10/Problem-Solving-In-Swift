// 112
func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else { return false }

    if root.left == nil && root.right == nil {
        return root.val - targetSum == 0
    }

    return hasPathSum(root.left, targetSum - root.val ) || hasPathSum(root.right, targetSum - root.val )

}