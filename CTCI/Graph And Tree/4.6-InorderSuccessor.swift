/*
    if has right tree
        - if it's leaf || dont have left return it
        - else if recur with left
    else check first ancestor
        - if ancestor is bigger than target return it
        - else traverse up, check the above condition with next ancestor to previous 
 
 */
 
class Solution {
  func inorderSuccessor(_ node: Node?) -> Node? {
    guard let root = node else { return nil }
    
    if let successor = checkLeftTree(root.right) {
        return successor
    }
    
    var current = node
    var parent = node?.parent
    
    while current != nil && parent != nil {
        if current!.val < parent!.val {
            return parent
        }
       
        current = parent
        parent = current?.parent

    }
    
    return nil
}

func checkLeftTree(_ root: Node?) -> Node? {
    guard let root = root else { return nil }
    if root.left == nil { return root }
    return checkLeftTree(root.left)
}

}