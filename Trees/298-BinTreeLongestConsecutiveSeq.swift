class Solution {
    var maxLength = 0
    
     func longestConsecutive(_ root: TreeNode?) -> Int {
         dfs(root)
         return maxLength
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
       
        var leftCount = dfs(root.left) + 1
        var rightCount = dfs(root.right) + 1
        
        if let left = root.left, left.val != root.val + 1  {
            leftCount =  1
        }
        
         if let right = root.right, right.val != root.val + 1 {
            rightCount = 1 
        }
        
        let length = max(leftCount, rightCount)
        maxLength = max(maxLength, length)
        
        return length
        
    }
}