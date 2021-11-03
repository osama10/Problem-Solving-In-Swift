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

class CBTInserter {
    var root: TreeNode?
    var queue = [TreeNode]()
    
    init(_ root: TreeNode?) {
        self.root = root
        bfs()
    }
    
    func insert(_ val: Int) -> Int {
        let node = TreeNode(val)
        queue.append(node)
                
        var top = queue[0]
        
        if top.left == nil {
            top.left = node
        } else {
            top.right = node
            queue.removeFirst()
        }
        
        return top.val
        
    }
    
    func get_root() -> TreeNode? {
        root
    }
    
    func bfs() {
        if root == nil { return }
        queue.append(root!)
        while !queue.isEmpty {
            let top = queue[0]
            
            if top.left == nil || top.right == nil { 
                if  top.left != nil{
                    queue.append(top.left!)
                } 

                break
            }
            
            queue.removeFirst()

            if let left = top.left {
                queue.append(left)
            }
            
            if let right = top.right {
                queue.append(right)
            }
        }
    }
}

/**
 * Your CBTInserter object will be instantiated and called as such:
 * let obj = CBTInserter(root)
 * let ret_1: Int = obj.insert(val)
 * let ret_2: TreeNode? = obj.get_root()
 */
