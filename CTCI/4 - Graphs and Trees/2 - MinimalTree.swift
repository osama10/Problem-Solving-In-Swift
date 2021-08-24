/// 4.2 Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.

func createMinimalTree(_ sortedArray: [Int]) -> TreeNode? {
    if sortedArray.isEmpty { return nil }
    return createBST(0, sortedArray.count - 1, sortedArray)
}

func createBST(_ lo: Int, _ hi: Int, _ array: [Int]) -> TreeNode? {
    guard lo <= hi else { return nil }
    let mid  = (lo + hi)/2
    let value = array[mid]
    let parent = TreeNode(value)
    parent.left = createBST(lo, mid - 1, array)
    parent.right = createBST(mid + 1, hi, array)
    return parent
}

printLevelOrderTree(createMinimalTree([0,1,2,3,4,5]))

func printLevelOrderTree(_ tree: TreeNode?) {
    var queue = [tree!]
    while !queue.isEmpty {
        var child = [TreeNode]()
        var level = [Int]()
        queue.forEach { parent in
            level.append(parent.val)
            if let left = parent.left { child.append(left)}
            if let right = parent.right { child.append(right)}
        }
        print(level)
        queue = child
    }
}
