
import Foundation
/// 336  https://github.com/privateHmmmm/leetcode/blob/master/366-find-leaves-of-binary-tree/find-leaves-of-binary-tree.py

func findLeaves(_ root: TreeNode?) -> [[Int]] {
    var path = [[Int]]()

    func helper(_ node: TreeNode?) -> Int {
        if node == nil { return -1 }
        let maxDepth = max(helper(node?.left), helper(node?.right)) + 1
        if path.count == maxDepth { path.append([Int]()) }
        path[maxDepth].append(node!.val)
        return maxDepth
    }

    helper(root)

    return path
}


var leaf1 = TreeNode(4)
var leaf2 = TreeNode(5)
var leaf3 = TreeNode(3)
var node = TreeNode(2, leaf1, leaf2)
var root = TreeNode(1, node, leaf3)


findLeaves(root)
