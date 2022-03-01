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
    
    func findDistance(_ root: TreeNode?, _ p: Int, _ q: Int) -> Int {
        let targetNodes = Set<Int>([p, q])
        _ = lca(root, targetNodes)
        return findDistance(lcaNode!, p, q)
    }
    
    func lca(_ root: TreeNode?, _ targetNodes: Set<Int>) -> Int {
        guard let root = root else { return 0 }
        
        var count = 0
        
        count += lca(root.left, targetNodes)
        count += lca(root.right, targetNodes)
        
        count += targetNodes.contains(root.val) ? 1 : 0
        
        if count >= targetNodes.count && lcaNode == nil {
            lcaNode = root
        }
        
        return count
    }
    
    func findDistance(_ root: TreeNode, _ p: Int, _ q: Int) -> Int {
        var queue = [(root, 0)]
        
        var pDist = -1
        var qDist = -1
        
        while !queue.isEmpty {
            let count = queue.count 
            let (node, dist) = queue.removeFirst()
                
            if node.val == p {
                pDist = dist
            } 
            
            if node.val == q {
                qDist = dist
            } 

            if pDist != -1 && qDist != -1 {
                break
            }
            
            if let left = node.left {
                queue.append((left, dist + 1))
            }
            
            if let right = node.right {
                queue.append((right, dist + 1))
            }
        }
        
        return qDist + pDist
    }
}