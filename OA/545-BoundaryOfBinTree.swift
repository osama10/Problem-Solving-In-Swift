class Solution {
    func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        
        if root?.right == nil && root?.left == nil { return [root!.val] } // edge case
       
        var roots = [Int]()
        var leftBoundary = [Int]()
        var rightBoundary = [Int]()
        
        collectRoots(root, &roots)
        collectLeftBoundary(root?.left, &leftBoundary)
        collectRightBoundary(root?.right, &rightBoundary)
        
        return [root!.val] + leftBoundary + roots + rightBoundary.reversed()
    }
    
    func collectRoots(_ root: TreeNode?, _ roots: inout [Int]) {
        guard let root = root else { return }
        
        if root.left == nil && root.right == nil {
            roots.append(root.val)
            return
        }
        
        collectRoots(root.left, &roots)
        collectRoots(root.right, &roots)
    }
    
    func collectLeftBoundary(_ root: TreeNode?, _ leftBoundary: inout[Int]) {
        guard let root = root else { return }
        
        if let left  = root.left {
            leftBoundary.append(root.val)
            collectLeftBoundary(left, &leftBoundary)
            return
        }
        
        if let right = root.right {
            leftBoundary.append(root.val)
            collectLeftBoundary(right, &leftBoundary)
            return
        }
    }
    
    func collectRightBoundary(_ root: TreeNode?, _ rightBoundary: inout[Int]) {
        guard let root = root else { return }
        
         if let right = root.right {
            rightBoundary.append(root.val)
            collectRightBoundary(right, &rightBoundary)
            return
        }
            
        if let left  = root.left {
            rightBoundary.append(root.val)
            collectRightBoundary(left, &rightBoundary)
            return
        }
        
    }
}