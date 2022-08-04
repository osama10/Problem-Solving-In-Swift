class Solution1 {
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    guard let p = p,
          let q = q
    else { return nil }
    
    return lca(root, p, q)
}

func lca(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
    guard let root = root else { return nil }
    
    if root.val < p.val && root.val < q.val {
        return lca(root.right, p, q)
    } else if root.val > p.val && root.val > q.val {
        return lca(root.left, p, q)
    } else {
        return root
    }
}
    
}


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

    for node in ancestorOfQ {
        if let node = dictOfP[node.val] {
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


class Solution3 {
    var lcaNode: TreeNode?
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { return nil }
        let nodes = [p, q]
        lca2(root, nodes)
        return lcaNode
    }

    func lca2(_ root: TreeNode?, _ nodes: [TreeNode]) -> Int {
        guard let root = root, !nodes.isEmpty else { return 0 }
        
        var count = nodes.contains{ $0 === root } ? 1 : 0
        count += lca2(root.left, nodes)
        count += lca2(root.right, nodes)
        
        if count >= nodes.count && lcaNode == nil {
            lcaNode = root
        }
        
        return count
    }
}
