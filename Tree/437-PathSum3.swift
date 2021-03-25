// 437
func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    if root == nil { return 0 }
    var sumFrequency = [Int: Int]()
    sumFrequency[0] = 1
    var totalPaths = 0
    calculatePaths(root, sum, 0, &sumFrequency, &totalPaths)
    return totalPaths
}

func calculatePaths(_ root: TreeNode?, _ target: Int, _ prevSum: Int, _ sumFrequency: inout [Int: Int], _ totalPaths: inout Int) {
    guard let root = root else { return }
    let sum = prevSum + root.val
    totalPaths += sumFrequency[sum - target, default: 0]

    sumFrequency[sum] = sumFrequency[sum, default: 0] + 1

    calculatePaths(root.left, target, sum, &sumFrequency, &totalPaths)
    calculatePaths(root.right, target, sum, &sumFrequency, &totalPaths)

    sumFrequency[sum] = sumFrequency[sum, default: 0] - 1
}