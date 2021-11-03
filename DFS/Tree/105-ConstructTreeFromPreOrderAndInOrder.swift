class Solution {
var preOrderIndex = 0
var inOrderIndexDict = [Int: Int]()

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    for i in 0..<inorder.count {
        inOrderIndexDict[inorder[i]] = i
    }
    
    return buildTree(preorder, 0, inorder.count - 1)
}


func buildTree(_ preorder: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    guard left <= right else { return nil }
    
    let rootIndex = inOrderIndexDict[preorder[preOrderIndex]]!
    let rootVal = preorder[preOrderIndex]
    
    preOrderIndex += 1
 
    let leftTree = buildTree(preorder, left, rootIndex - 1)
    let rightTree = buildTree(preorder, rootIndex + 1, right)
    
    return TreeNode(rootVal, leftTree, rightTree)

}

}