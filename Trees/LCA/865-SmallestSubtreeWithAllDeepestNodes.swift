/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    var lcaNode: TreeNode?

    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        var queue = [root]
        var targetLeaves = Array(repeating: root, count: 2)
        
        while !queue.isEmpty {
            targetLeaves[0] = queue.first!
            targetLeaves[1] = queue.last!
            let count = queue.count
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
                
            }
            
        }
        
        if targetLeaves[0] === targetLeaves[1] { return targetLeaves[0] }
        
        lca(root, targetLeaves[0], targetLeaves[1])
        
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