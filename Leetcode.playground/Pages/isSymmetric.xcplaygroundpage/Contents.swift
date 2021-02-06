import Foundation

//101

func isSymmetric(_ root: TreeNode?) -> Bool { checkSymetery(root, root) }

func checkSymetery(_ firstTree: TreeNode?, _ secondTree: TreeNode?) -> Bool {

 if firstTree == nil && secondTree == nil { return true }
 if firstTree == nil || secondTree == nil { return false }

 let isSymmetric = (firstTree?.val == secondTree?.val)
 return isSymmetric && checkSymetery(firstTree?.right, secondTree?.left) && checkSymetery(firstTree?.left, secondTree?.right)
}
