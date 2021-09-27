func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let left = invertTree(root.right)
        let right = invertTree(root.left)
        return TreeNode(root.val, left, right)
    }