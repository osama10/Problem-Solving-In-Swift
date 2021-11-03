 func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil { return root2 }
        if root2 == nil { return root1} 
        
        let left = mergeTrees(root1?.left, root2?.left)
        let right = mergeTrees(root1?.right, root2?.right)
        
        return TreeNode(root1!.val + root2!.val, left, right)

}