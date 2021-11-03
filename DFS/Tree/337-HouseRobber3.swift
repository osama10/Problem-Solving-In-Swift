class Solution {
    
    func rob(_ root: TreeNode?) -> Int {
        let (rob, notRob) = maxAmount(root)
        return max(rob, notRob)
    }
    
    func maxAmount(_ root: TreeNode?) -> (rob: Int, notRob: Int) {
        guard let root = root else { return (0, 0) }
        
        let leftAmount = maxAmount(root.left)
        let rightAmount = maxAmount(root.right)
        
        let rob = root.val + leftAmount.notRob + rightAmount.notRob
        let notRob = max(leftAmount.rob, leftAmount.notRob) + max(rightAmount.rob, rightAmount.notRob)
        return (rob, notRob)
    }
    
}
