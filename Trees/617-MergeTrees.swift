func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    guard let root1 = root1,
            let root2 = root2
    else { return root1 == nil ? root2 : root1 }
    
    let val = root1.val + root2.val
    
    let leftChild = mergeTrees(root1.left, root2.left)
    let rightChild = mergeTrees(root1.right, root2.right)

    return TreeNode(val, leftChild, rightChild)
}
