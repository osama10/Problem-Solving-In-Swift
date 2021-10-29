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
    var result = [[Int]]()
    
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        calHeight(root)
        return result
    }
    
    func calHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
       
        let left = calHeight(root.left)
        let right = calHeight(root.right)
        
        let height = max(left, right) + 1
        
        if result.count == height - 1 {
            result.append([root.val])
        } else {
            result[height - 1].append(root.val)
        }
        
        return height

    }
}