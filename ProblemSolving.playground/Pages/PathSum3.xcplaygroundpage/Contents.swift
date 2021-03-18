import Foundation

//: 437


func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    var totalPaths = 0
    var parentSum = [TreeNode]()
    depthFirstTraversal(root, &totalPaths, parentSum:  &parentSum , sum)
    return totalPaths
}

func depthFirstTraversal(_ tree: TreeNode?, _ totalPaths: inout Int, parentSum: inout [TreeNode], _ targetSum:  Int) {
    guard let tree = tree else { return }
    var parentSum = parentSum

    if tree.val == targetSum { totalPaths += 1 }

    var totalSum = tree.val

    for index in stride(from: parentSum.count - 1, to: -1, by: -1) {
        totalSum +=  parentSum[index].val
        if totalSum == targetSum { totalPaths += 1 }
    }

    parentSum.append(tree)

    depthFirstTraversal(tree.left, &totalPaths, parentSum: &parentSum, targetSum)
    depthFirstTraversal(tree.right, &totalPaths, parentSum: &parentSum, targetSum)

    parentSum.removeLast()

}



