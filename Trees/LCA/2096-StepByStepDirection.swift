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
    typealias Node = (node: TreeNode, path: String)
    
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        guard let root = lca(root, Set([startValue, destValue])) else { return "" }
        return shortestPath(root, startValue, destValue)
    }
    
    func shortestPath(_ root: TreeNode, _ startValue: Int, _ destValue: Int) -> String {
        var queue: [Node] = [(root, "")]
        var srcPath = ""
        var destPath = ""
        
        while !queue.isEmpty {
            let node = queue.removeFirst()

            if node.node.val == startValue {
                srcPath = node.path
            } else if node.node.val == destValue {
                destPath = node.path
            } else if !srcPath.isEmpty && !destPath.isEmpty {
                break
            }

            if let left = node.node.left {
                queue.append((left, node.path + "L"))
            }

            if let right = node.node.right {
                queue.append((right, node.path + "R"))
            }

        }
        
        return String(repeating: "U", count: srcPath.count) + destPath
    }
    
    func lca(_ root: TreeNode? , _ values: Set<Int>) -> TreeNode? {
        guard let root = root else { return nil }
        
        if values.contains(root.val) {
            return root
        }
        
        let left = lca(root.left, values)
        let right = lca(root.left, values)
        
        if left == nil {
            return right
        }
        
        if right == nil {
            return left
        }
        
        return root
    }
}