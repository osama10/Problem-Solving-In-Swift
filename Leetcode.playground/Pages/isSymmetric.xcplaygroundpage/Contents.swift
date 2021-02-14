import Foundation

//101

func isSymmetric(_ root: TreeNode?) -> Bool { checkForSymmetry(root, root) }

func checkForSymmetry(_ tree1: TreeNode?, _ tree2: TreeNode?) -> Bool {
    if tree1 == nil && tree2 == nil { return true }
    if tree1 == nil || tree2 == nil { return false }

    return tree1?.val == tree2?.val && checkForSymmetry(tree1?.left, tree2?.right) && checkForSymmetry(tree1?.right, tree2?.left)

}
