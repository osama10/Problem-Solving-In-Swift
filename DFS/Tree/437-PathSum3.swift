class Solution {
   var dict = [Int: Int]()
   var count = 0

    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var prefixSum = 0
        pathSum(root, targetSum, prefixSum)
        return count
    }
    
    func pathSum(_ root: TreeNode?, _ target: Int, _ prefixSum: Int) {
        guard let root = root else { return }
       
        let prefixSum = prefixSum + root.val
        
        if prefixSum == target {
            count += 1
        }
        
        if let otherCount = dict[prefixSum - target] {
            count += otherCount 
        }
        
        dict[prefixSum] = dict[prefixSum, default: 0] + 1
        
        pathSum(root.left, target, prefixSum)
        pathSum(root.right, target, prefixSum)
        
        dict[prefixSum] = dict[prefixSum, default: 0] - 1
    }
}