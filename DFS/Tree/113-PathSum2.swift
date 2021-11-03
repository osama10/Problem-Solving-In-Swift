func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    guard  let root = root else { return [] }
    var allPaths = [[Int]]()
    var path = [Int]()
     
    pathSum(root, targetSum, &path, &allPaths)
    return allPaths
}

func pathSum(_ root: TreeNode?, _ targetSum: Int, _ path: inout [Int], _ allPaths: inout [[Int]]) {
    guard let root = root else { return }
    
    path.append(root.val)

    if root.left == nil && root.right == nil {
        if targetSum == root.val  {
            allPaths.append(path)
        }
    }
    
    pathSum(root.left, targetSum - root.val, &path, &allPaths)
    pathSum(root.right, targetSum - root.val, &path, &allPaths)
    
    path.removeLast()

}
