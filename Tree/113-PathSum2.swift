// 113 
func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    var path = [Int]()
    var allPaths = [[Int]]()
    hasPathSum(root, targetSum, &path, &allPaths)
    return allPaths
}

func hasPathSum(_ root: TreeNode?, _ targetSum: Int, _ path: inout [Int], _ allPaths: inout [[Int]]) {
    guard let root = root else { return  }

    path.append(root.val)

    if root.left == nil && root.right == nil {
        if (root.val - targetSum == 0) { allPaths.append(path) }
        path.removeLast()
        return
    }

    hasPathSum(root.left, targetSum - root.val, &path, &allPaths )
    hasPathSum(root.right, targetSum - root.val , &path, &allPaths )

    path.removeLast()
}