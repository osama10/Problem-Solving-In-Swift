class Solution {
    var count = 0
    
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        isUnivalSubtree(root)
        return count
    }
    
    func isUnivalSubtree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        if root.left == nil && root.right == nil {
            count += 1
            return true
        }
        
        let isLeftUnival = isUnivalSubtree(root.left) 
        let isRightUnival = isUnivalSubtree(root.right) 
        
        if (!isLeftUnival || !isRightUnival)  { return false }
       
        if let left = root.left, left.val != root.val { return false }
       
        if let right = root.right,  right.val != root.val { return false }
        
        count += 1
        return true
        
    }
}