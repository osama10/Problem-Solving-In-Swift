/// 4.5 Validate BST: Implement a function to check if a binary tree is a binary search tree.

func isValidBST(_ tree: TreeNode?) -> Bool {

    var nodeArray = [Int]()
    inOrderTraversal(tree: tree, nodeArray: &nodeArray)
    
    guard !nodeArray.isEmpty,
           nodeArray.count > 1
    else { return true }
  
    for i in 1..<nodeArray.count {
        if nodeArray[i - 1] >= nodeArray[i] { return false }
    }
    
    return true
}

func inOrderTraversal(tree: TreeNode?, nodeArray: inout [Int]) {
    guard let tree = tree else { return }
    inOrderTraversal(tree: tree.left, nodeArray: &nodeArray)
    nodeArray.append(tree.val)
    inOrderTraversal(tree: tree.right, nodeArray: &nodeArray)
}


func isValidBST(tree: TreeNode?) -> Bool {
    checkForValidBST(tree: tree, min: nil, max: nil)
}

func checkForValidBST(tree: TreeNode?, min: Int?, max: Int?) -> Bool {
    guard let tree = tree else { return true }
    
    if (min != nil && min! >= tree.val ) || (max != nil && max! <= tree.val ) { return false }
    
    let isLeftTreeValid = checkForValidBST(tree: tree.left, min: min, max: tree.val)
    let isRightTreeValid = checkForValidBST(tree: tree.right, min: tree.val, max: max)
    
    return isLeftTreeValid && isRightTreeValid

}
