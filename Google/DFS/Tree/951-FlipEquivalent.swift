func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    guard let root1 = root1,
          let root2 = root2
    else { return root1 === root2 }
    
    return tryToMakeEquivalend(root1, root2)
}

func tryToMakeEquivalend(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    guard let root1 = root1,
          let root2 = root2
    else { return root1 === root2 }
    
    guard root1.val == root2.val else { return false }
    
    if root1.left?.val == root2.left?.val
        && root1.right?.val == root2.right?.val  {
        
        return tryToMakeEquivalend(root1.left, root2.left) && tryToMakeEquivalend(root1.right, root2.right)
    }
            
    let temp = root1.right
    root1.right = root1.left
    root1.left = temp
    
    return tryToMakeEquivalend(root1.left, root2.left)
        && tryToMakeEquivalend(root1.right, root2.right)
}
