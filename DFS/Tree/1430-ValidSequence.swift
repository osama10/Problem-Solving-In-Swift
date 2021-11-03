  func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        guard let root = root else { return false }
        return isValidSequence(root, arr, 0)
    }
    
    func isValidSequence(_ root: TreeNode?, _ arr: [Int], _ index: Int) -> Bool {
        guard let root = root else { return false }
        
        if index > arr.count - 1 {
            return false
        }
        
        if root.val != arr[index] {
            return false 
        }
        
        if root.left == nil && root.right == nil {
            if index != arr.count - 1 {
                return false
            } else {
                return true
            }
        }
        
        return isValidSequence(root.left, arr, index + 1) || isValidSequence(root.right, arr, index + 1)
        
    }