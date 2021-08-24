/// 4.4 Check Balanced: Implement a function to check if a binary tree is balanced. For the purposes of this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.

func isBalanced(root: TreeNode?) -> Int {
    if root == nil { return 0 }
   
    let leftHeight = isBalanced(root: root?.left)
    if leftHeight == Int.min { return Int.min }
   
    let rightHeight = isBalanced(root: root?.right)
    if rightHeight == Int.min { return Int.min }
    
    if abs(leftHeight - rightHeight) > 1 { return Int.min }


    return max(rightHeight, leftHeight) + 1
}

let root = TreeNode(2)
let rootRight = TreeNode(4)
let rootLeft = TreeNode(0)

root.left = rootLeft

let child0 = TreeNode(-1)
let child1 = TreeNode(1)
let child2 = TreeNode(3)
let child3 = TreeNode(5)

rootLeft.left = child0
rootLeft.right = child1


print(isBalanced(root: root) != Int.min)
