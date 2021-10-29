class Solution {
func connect(_ root: Node?) -> Node? {
    guard let root = root else { return root }
    var queue = [root]
    
    while !queue.isEmpty {
        let size = queue.count - 1
            for i in 0...size {
                let node = queue.removeFirst()
                if i != size {
                    node.next = queue.first
                }
                
                if node.left != nil { queue.append(node.left!) }
             if node.right != nil { queue.append(node.right!) }
            }
        }
    
    return root
}

}

