/// 653
func inorderTraversal(_ node: TreeNode?, _ sortedArray: inout[Int]) {
        guard let node = node else { return }
        inorderTraversal(node.left, &sortedArray)
        sortedArray.append(node.val)
        inorderTraversal(node.right, &sortedArray)
    }
    
    func checkTwoSumOnSortedArray(_ arr: [Int], _ target: Int) -> Bool {
        var low = 0
        var hi = arr.count - 1
        while low < hi {
            let sum = arr[low] + arr[hi]
            if sum == target { return true }
            else if sum < target { low += 1 }
            else { hi -= 1 }
        }
        
        return false
    }
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
            if root == nil || (root?.left == nil && root?.right == nil) { return false }
            var sortedArray =  [Int]()
            inorderTraversal(root, &sortedArray)
            return checkTwoSumOnSortedArray(sortedArray, k)
    }