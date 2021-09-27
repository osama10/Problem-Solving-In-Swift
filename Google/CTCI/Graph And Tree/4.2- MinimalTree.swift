  func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
         createHeightBalancedTree(nums, 0, nums.count - 1)
}

func createHeightBalancedTree(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
    if lo > hi { return nil }
    let mid = (hi + lo)/2
    let root = TreeNode(nums[mid])
    
    root.left = createHeightBalancedTree(nums, lo, mid - 1)
    root.right = createHeightBalancedTree(nums, mid + 1 , hi)
    
    return root
}