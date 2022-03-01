class Solution {
    var subRootSums = [Int]()
    
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        let totalSum = calRootSum(root)
        subRootSums.removeLast()
        
        guard totalSum % 2 == 0 else { return false }
        for sum in subRootSums {
            if sum == totalSum / 2 {
                return true
            }
        }
        
        return false
    }
    

    func calRootSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftSum = calRootSum(root.left)
        let rightSum = calRootSum(root.right)
        
        let totalSum = leftSum + rightSum + root.val
        
        subRootSums.append(totalSum)

        return totalSum
    }
}