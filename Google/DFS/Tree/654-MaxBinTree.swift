func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        
        return findMaxSubtree(nums, startIndex: 0, endIndex: nums.count-1)
    }
    
    func findMaxSubtree(_ nums: [Int], startIndex: Int, endIndex: Int) -> TreeNode? {
        guard startIndex <= endIndex else { return nil }
        
        let maxIndex = findMaxNumberIndex(nums, startIndex: startIndex, endIndex: endIndex)
        let root = TreeNode(nums[maxIndex])
        root.left = findMaxSubtree(nums, startIndex: startIndex, endIndex: maxIndex-1)
        root.right = findMaxSubtree(nums, startIndex: maxIndex+1, endIndex: endIndex)
        return root
        
        return nil
    }
    
    func findMaxNumberIndex(_ nums: [Int], startIndex: Int, endIndex: Int) -> Int {
        var maxIndex = startIndex
        
        for i in startIndex...endIndex {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        
        return maxIndex
    }