//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }
    var path = [Int]()
    traverseInorder(root, &path)
    return path
}

func traverseInorder(_ node: TreeNode?, _ path: inout[Int]) {
    if node == nil { return }
    traverseInorder(node?.left, &path)
    path.append(node!.val)
    traverseInorder(node?.right, &path)

}
