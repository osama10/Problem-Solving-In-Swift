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

    typealias  Result = (max: Int, min: Int, size: Int)
    
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        getLargestBST(root).size
    }
    
    func getLargestBST(_ root: TreeNode?) -> Result {
        guard let root = root else { return (Int.min, Int.max, 0) }
        
        let left = getLargestBST(root.left)
        let right = getLargestBST(root.right)
        
        if root.val > left.max && root.val < right.min {
            let minVal = min(root.val, left.min)
            let maxVal = max(root.val, right.max)
            let size = left.size + right.size + 1
            return (maxVal, minVal, size)
        }
        
        return(Int.max, Int.min, max(left.size, right.size))
    }
}