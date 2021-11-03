/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    let nullString = "#"
    
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return nullString }
        let leftStr = serialize(root.left)
        let rightStr = serialize(root.right)
        
        return [String(root.val), leftStr, rightStr].joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var nodes = data
        .split(separator: ",")
        .reversed()
        .map { String($0) }
        
        return createTree(&nodes)
    }
    
    func createTree(_ nodeList: inout [String]) -> TreeNode? {
        if nodeList.isEmpty {
            return nil
        }
        
        let value = nodeList.removeLast()
        
        if value == nullString {
            return nil
        }
        
        let root = TreeNode(Int(value)!)
        let left = createTree(&nodeList)
        let right = createTree(&nodeList)
        
        root.left = left
        root.right = right
        
        return root
        
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))