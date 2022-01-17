class Solution {
var longestPathLength = 0

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    dfs(root)
    return longestPathLength
}

func dfs(_ root: TreeNode?) -> Int {
    guard let root = root else { return -1 }
    
    var leftPath = dfs(root.left) + 1
    var rightPath = dfs(root.right) + 1
        
    if let leftVal = root.left?.val, leftVal != root.val {
        leftPath = 0
    }

    if let rightVal = root.right?.val, rightVal != root.val {
        rightPath = 0
    }
    
    longestPathLength = max(longestPathLength, leftPath + rightPath)
    
    return max(leftPath, rightPath)
    
}
