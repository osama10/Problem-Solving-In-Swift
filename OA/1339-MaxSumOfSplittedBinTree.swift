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
    func maxProduct(_ root: TreeNode?) -> Int {
        var subrootSum = [Int]()
        let totalSum = calculateSum(root, &subrootSum)
        
        var maxProductSum = Int.min
       
        for sum in subrootSum {
            let productSum = (totalSum - sum) * sum
            maxProductSum = max(maxProductSum, productSum)
        }
        
        return maxProductSum % 1000_000_007
    }
    
    func calculateSum(_ root: TreeNode?, _ subrootSums: inout [Int]) -> Int {
        guard let root = root else { return 0 }
        
        let leftSum = calculateSum(root.left, &subrootSums)
        let rightSum = calculateSum(root.right, &subrootSums)
        
        let rootSum = root.val + leftSum + rightSum
        subrootSums.append(rootSum)
        
        return rootSum
    }
}