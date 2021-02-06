
import Foundation
// 617
func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    if t1 == nil { return t2 }
    if t2 == nil { return t1 }

    let treeNode = TreeNode(t1!.val + t2!.val)
    treeNode.left = mergeTrees(t1?.left, t2?.left)
    treeNode.right = mergeTrees(t1?.right, t2?.right)
    return treeNode
}
