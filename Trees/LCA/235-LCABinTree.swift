/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iv/discuss/1527276/Java-0ms-beats-100-and-no-extra-memory



class Solution {
var lcaNode: TreeNode?

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let p = p,
          let q = q else { return nil }
    
    lca(root, p, q)
    return lcaNode 
}


func lca(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> Bool {
    guard let root = root else { return false }
    
    let left = lca(root.left, p, q) ? 1 : 0
    let right = lca(root.right, p, q) ? 1 : 0
    let thisNode = (root.val == p.val || root.val == q.val) ? 1 : 0
    
    if thisNode + left + right >= 2 {
        lcaNode = root
        return true
    }
    
    return (thisNode + left + right) == 1
    
}

}


class Solution1 {

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        lca(root, p, q)
    }

    func lca(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p === root || q === root {
            return root
        }
        
        let left = lca(root?.left, p, q)
        let right = lca(root?.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        
        return left == nil ? right : left
    }

}
