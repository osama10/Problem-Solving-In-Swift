class Solution {
    var longestPath = 0
    
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        dfs(root)
        return longestPath
    }
    
    func dfs(_ root: TreeNode?)  -> Int {
        guard let root = root else { return  0 }
        
        let leftVal = dfs(root.left)
        let rightVal = dfs(root.right)
        
        var arrowRight = 0
        var arrowLeft = 0

       if let left = root.left, left.val == root.val {
           arrowLeft = 1 + leftVal
       }
        
        if let right = root.right, right.val == root.val {
           arrowRight = 1 + rightVal
       }
        
        longestPath = max(longestPath, arrowRight + arrowLeft)
        
        return max(arrowRight, arrowLeft)
    }
}
