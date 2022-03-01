/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        var curr = head
        flattendChild(curr)
        return head
    }
    
    func flattendChild(_ head: Node) -> Node {
                
        var curr: Node? = head 
        var tail = curr
        
        while let currNode = curr {
            let currNext = currNode.next
            tail = currNode
           
            if let child = currNode.child {
                let childTail = flattendChild(child)
                
                currNode.next = child
                child.prev = currNode
                
                currNext?.prev = childTail
                childTail.next = currNext
                
                currNode.child = nil
                
                tail = childTail
            }
            
            curr = currNext
        }
        
        return tail!
    }
}