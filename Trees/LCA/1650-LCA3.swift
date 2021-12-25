/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public var parent: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.parent = nil
 *     }
 * }
 */

class Solution {
    
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var a = p
        var b = q
                
        while a !== b {
            a = a != nil ? a?.parent : q
            b = b != nil ? b?.parent: p
        }
        
        return a
    }
}