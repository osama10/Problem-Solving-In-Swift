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
        let leftString = serialize(root.left)
        let rightString = serialize(root.right)
        return ["\(root.val)", leftString, rightString]
            .joined(separator: ",")
    }

    func deserialize(_ string: String) -> TreeNode? {
        var nodeVals: [String] = string
                        .split(separator: ",")
                        .map(String.init)
                        .reversed()
        
        return buildTree(&nodeVals)
    }

    func buildTree(_ nodeVals: inout [String]) -> TreeNode? {
        guard !nodeVals.isEmpty else { return nil }
        let value = nodeVals.removeLast()
        guard value != nullString else { return nil }
        
        let left = buildTree(&nodeVals)
        let right = buildTree(&nodeVals)
        
        return TreeNode(Int(value)!, left, right)
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
