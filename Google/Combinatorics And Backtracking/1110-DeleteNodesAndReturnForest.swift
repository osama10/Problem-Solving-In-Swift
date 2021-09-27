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
    var targetValues = Set<Int>()

    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    guard !to_delete.isEmpty else { return [root] }
    guard let root = root else { return [] }
    var remainingRoots = [TreeNode?]()
    to_delete.forEach { targetValues.insert($0) }
  
    if !targetValues.contains(root.val) {
        remainingRoots.append(root)
    }
        
    getRootsAfterDeleting(root, &remainingRoots)
    return remainingRoots
}

func getRootsAfterDeleting(_ root: TreeNode?, _ remainingRoots: inout [TreeNode?]) -> TreeNode? {
    guard let root = root else { return nil }

     root.left = getRootsAfterDeleting(root.left, &remainingRoots)
     root.right = getRootsAfterDeleting(root.right, &remainingRoots)
    
    if targetValues.contains(root.val) {
        if let left = root.left {
            remainingRoots.append(left)
        }
       
        if let right = root.right {
            remainingRoots.append(right)
        }
        
        return nil
    }
    
    return root
}

}