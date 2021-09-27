class Solution {
var lca: TreeNode?

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    guard let p = p,
          let q = q
    else { return nil }
    
    lcaUtil(root, p, q)
    return lca ?? TreeNode(2)
}

func lcaUtil(_ root: TreeNode?, _ node1: TreeNode, _ node2: TreeNode) -> Bool {
    guard let root = root else { return false }
    
    let left = lcaUtil(root.left, node1, node2) ? 1 : 0
    let right = lcaUtil(root.right, node1, node2) ? 1 : 0
    let mid = (root.val == node1.val || root.val == node2.val) ? 1 : 0
   
    if (left + right + mid) >= 2 {
        lca = root
        return true
    }

    return (left + right + mid) == 1
}

}