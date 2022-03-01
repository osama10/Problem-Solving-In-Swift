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
    
    var maxAvg: Double = 0
    
    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        dfs(root)
        return maxAvg
    }
    
    func dfs(_ root: TreeNode?) ->(sum: Int, count: Int) {
        guard let root = root else { return (0, 0) }
        
        let leftResult = dfs(root.left)
        let rightResult = dfs(root.right)
        
        let sum = leftResult.sum + rightResult.sum + root.val
        let count = leftResult.count + rightResult.count + 1
        
        let avg = Double(sum) / Double(count)
        
        maxAvg = max(maxAvg, avg)
        
        return (sum, count)
    }
}