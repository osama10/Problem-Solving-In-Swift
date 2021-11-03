    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil { return true }
       
        guard let subRoot = subRoot,
              let root = root
            else { return false }
        
        if isIdentical(root, subRoot) {
            return true
        }

        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }
    
    func isIdentical(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
         if root == nil && subRoot == nil { return true }
       
        guard let subRoot = subRoot,
              let root = root
            else { return false }
        
         
        return subRoot.val == root.val && 
        isIdentical(root.left, subRoot.left) &&
        isIdentical(root.right, subRoot.right) 

    }