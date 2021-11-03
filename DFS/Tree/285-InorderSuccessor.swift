/*
    if has right tree
        - if it's leaf || dont have left return it
        - else if recur with left
    else check first ancestor
        - if ancestor is bigger than target return it
        - else traverse up, check the above condition with next ancestor to previous 
 
 */
 

class Solution {
 var parents = [Int: TreeNode]()

func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
    guard let root = root,
          let target = p
    else { return nil }
    
    if let successor = checkLeftTree(target.right) {
        return successor
    }
    
    getAncestors(root, target.val, nil)
    
    var current: TreeNode? = target
    var parent = parents[target.val]
    
    while current != nil && parent != nil {
    

        if  parent!.val > current!.val {
            return parent
        }
        
        current = parent
        parent = parents[current!.val]
    }
    
    return nil
}

func checkLeftTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    if root.left == nil { return root }
    return checkLeftTree(root.left)
}

func getAncestors(_ root: TreeNode?, _ target: Int, _ parentNode: TreeNode?) -> Bool {
    guard let root = root else { return false }
  
    parents[root.val] = parentNode
    
    if root.val == target {
        return true
    }
    
    let inLeft = root.val > target ? getAncestors(root.left,  target, root) : false
    let inRight = root.val <= target ? getAncestors(root.right, target, root) : false
    
    
    if inLeft || inRight {
        return true
    }

    return false
}
}