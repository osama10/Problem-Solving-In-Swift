func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    guard let root = root,
          let target = target
    else { return [] }
    var result = [Int]()
    var parents = [Int: TreeNode]()
    dfs(root, &parents)
    return bfs(target, k, parents)
}

func bfs(_ root: TreeNode, _ target: Int, _ parents: [Int: TreeNode]) -> [Int]{
    var queue = [root]
    var visited = Set<Int>()
    var currentLevel = 0
    
    while !queue.isEmpty {
        var children = [TreeNode]()
       
        if currentLevel == target {
            return queue.map { $0.val }
        }
        
        for node in queue {
            visited.insert(node.val)
            
            if let left = node.left, !visited.contains(left.val) {
                children.append(left)
            }
           
            if let right = node.right, !visited.contains(right.val) {
                children.append(right)
            }
            
            if let parent = parents[node.val], !visited.contains(parent.val) {
                children.append(parent)
            }
        }
       
        currentLevel += 1
        queue = children
    }
    
    return []
}

func dfs(_ root:TreeNode, _ parents: inout [Int: TreeNode]) {
    if let left = root.left {
        parents[left.val] = root
        dfs(left, &parents)
    }
    
    if let right = root.right {
        parents[right.val] = root
        dfs(right, &parents)
    }
}
