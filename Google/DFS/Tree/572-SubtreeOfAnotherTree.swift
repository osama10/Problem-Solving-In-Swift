func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    if root == nil && subRoot == nil { return true }
    
    guard let subRoot = subRoot,
          let root = root
    else { return false }
    
    if isIdentical(root, subRoot) {
        return true
    }
    
    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
}

func isIdentical(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    if root == nil && subRoot == nil { return true }
    
    guard let subRoot = subRoot,
          let root = root
    else { return false }
    
    
    return subRoot.val == root.val &&
    isIdentical(root.left, subRoot.left) &&
    isIdentical(root.right, subRoot.right)
    
}

/// using serialization of subtree method
class Solution1 {
    let nullString = "X"
    
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root,
              let subRoot = subRoot
        else { return root === subRoot}
        
        var subtrees1 = Set<String>()
        var subtrees2 = Set<String>()
        
        let s1 = decodeTree(root, &subtrees1)
        let s2 = decodeTree(subRoot, &subtrees2)
        
        return subtrees1.contains(s2)
    }
    
    
    func decodeTree(_ root: TreeNode?, _ substree: inout Set<String>) -> String {
        guard let root = root else { return nullString }
        
        let left = decodeTree(root.left, &substree)
        let right = decodeTree(root.right, &substree)
        
        let decodedString = ["\(root.val)", left, right].joined(separator: ",")
        
        substree.insert(decodedString)
        return decodedString
    }
    
}
