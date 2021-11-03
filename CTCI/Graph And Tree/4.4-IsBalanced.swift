 func isBalanced(_ root: TreeNode?) -> Bool {
         isBalancedUtil(root) != Int.min 
    }


    func isBalancedUtil(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
  
        let leftHeight = isBalancedUtil(root.left)
    
        if leftHeight == Int.min {
            return leftHeight
        }
    
        let rightHeight = isBalancedUtil(root.right)
    
        if rightHeight == Int.min {
            return rightHeight
         }
    
         return abs(leftHeight - rightHeight) < 2
                ? max(leftHeight, rightHeight) + 1
                : Int.min
}