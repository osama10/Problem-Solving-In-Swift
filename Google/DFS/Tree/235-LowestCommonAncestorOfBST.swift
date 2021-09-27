func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    guard let p = p,
          let q = q
    else { return nil }
    
    var ancestorOfP = [TreeNode]()
    var ancestorOfQ = [TreeNode]()
    
    lcaUtils(root, p, &ancestorOfP)
    lcaUtils(root, q, &ancestorOfQ)
    
    let dictOfP = ancestorOfP.reduce(into: [Int: TreeNode]()) { (dict, val) in
        dict[val.val] = val
    }

    for num in ancestorOfQ{
        if let node = dictOfP[num.val] {
            return node
        }
    }
    
    return nil
}

func lcaUtils(_ root: TreeNode?, _ target: TreeNode, _ ancestor: inout [TreeNode]) -> Bool {
    guard let root = root else { return false }
    
    let inLeft = target.val <= root.val ? lcaUtils(root.left, target, &ancestor) : false
    let inRight = target.val > root.val ? lcaUtils(root.right, target, &ancestor) : false
    
    if inLeft || inRight || root.val == target.val {
        ancestor.append(root)
        return true
    }

    return false
}

