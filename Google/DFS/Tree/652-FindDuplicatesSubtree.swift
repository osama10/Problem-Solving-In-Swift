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
    var map = [String: (root: TreeNode, count: Int)]()
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        serializeTree(root) 
        return map.filter { $0.value.count > 1 }.map{ $0.value.root }
    }
    
    func serializeTree(_ root: TreeNode?) -> String {
        guard let root = root else { return "X" }
        
        let left = serializeTree(root.left)
        let right = serializeTree(root.right)
        
        let key = "\(root.val)-\(left)-\(right)" 
        
        if let prevValue = map[key] {
            map[key] = (prevValue.root, prevValue.count + 1)
        } else {
            map[key] = (root, 1)
        }
        
        return key
    }
    
}