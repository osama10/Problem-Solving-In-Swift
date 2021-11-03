class Solution {
    var maxDiameter = Int.min
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        findDiameter(root)
        return maxDiameter - 1
    }
    
    func findDiameter(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = findDiameter(root.left)
        let right = findDiameter(root.right)
        maxDiameter = max(maxDiameter, left + right + 1)
        return max(left, right) + 1
    }
}