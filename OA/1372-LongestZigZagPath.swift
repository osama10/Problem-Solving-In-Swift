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
    enum Direction {
        case left
        case right
    }
    
    struct Data {
        let node: TreeNode
        let count: Int
        let direction: Direction
        
        init(_ node: TreeNode, _ count: Int, _ direction: Direction) {
            self.node = node
            self.count = count
            self.direction = direction
        }
        
    }
    
    func longestZigZag(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [Data]()
        var maxLength = 0
        
        if let left = root.left {
            let data = Data(left, 1, .left)
            queue.append(data)
        }
        
         if let right = root.right {
            let data = Data(right, 1, .right)
            queue.append(data)
        }
        
        while !queue.isEmpty { 
               let topData = queue.removeFirst()
                maxLength = max(topData.count, maxLength)
                
                if let left = topData.node.left {
                    let count = topData.direction == .right ? topData.count + 1 : 1
                    let leftNodeData = Data(left, count, .left)
                     queue.append(leftNodeData)
                 }

                if let right = topData.node.right {
                    let count = topData.direction == .left ? topData.count + 1 : 1
                    let rightNodeData = Data(right, count, .right)
                     queue.append(rightNodeData)
                 }
            
        }
        
        return maxLength
    }
}