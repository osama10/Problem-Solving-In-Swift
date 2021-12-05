class Solution {
 func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
      isFlipeEquivalent(root1, root2)
}

func isFlipeEquivalent(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    guard let root1 = root1,
            let root2 = root2
    else { return root1 === root2 }
    
    if root1.val != root2.val { return false }
    
    if (root1.left?.val == root2.left?.val)
        && (root1.right?.val == root2.right?.val) {
        return isFlipeEquivalent(root1.left, root2.left) && isFlipeEquivalent(root1.right, root2.right)
   
        }
    
    return isFlipeEquivalent(root1.right, root2.left) && isFlipeEquivalent(root1.left, root2.right)
    
}


}
