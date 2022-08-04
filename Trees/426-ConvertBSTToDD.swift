class Solution {
    var head: Node?
    var tail: Node?

    func treeToDoublyList(_ root: Node?) -> Node? {
       
        makeList(root)
    
        head?.left = tail
        tail?.right = head
        
        return head
    }
    
    
    func makeList(_ root: Node?) { 
        guard let root = root else { return }
        
        makeList(root.left)
        
        if tail != nil {
            root.left = tail
            tail?.right = root
        } else {
            head = root
        }
        
        tail = root
        makeList(root.right)
    }
}