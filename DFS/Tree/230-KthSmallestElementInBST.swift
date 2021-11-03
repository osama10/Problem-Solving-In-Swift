 func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var arr = [Int]()
        inOrder(root, &arr)
        return arr[k - 1]
    }
    
    func inOrder(_ root: TreeNode?, _ arr: inout[Int]) {
        guard let root = root else { return }
        inOrder(root.left, &arr)
        arr.append(root.val)
        inOrder(root.right,  &arr)
    }