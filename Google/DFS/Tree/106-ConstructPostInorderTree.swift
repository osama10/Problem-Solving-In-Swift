class Solution {
var preOrderIndex = 0
var inOrderIndexDict = [Int: Int]()

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    for i in 0..<inorder.count {
        inOrderIndexDict[inorder[i]] = i
    }
    preOrderIndex = postorder.count - 1
    return buildTree(postorder, 0, inorder.count - 1)
}


func buildTree(_ postorder: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    guard left <= right else { return nil }
    
    let rootIndex = inOrderIndexDict[postorder[preOrderIndex]]!
    let rootVal = postorder[preOrderIndex]
    preOrderIndex -= 1
    
    let rightTree = buildTree(postorder, rootIndex + 1, right)
    let leftTree = buildTree(postorder, left, rootIndex - 1)
    
    
    return TreeNode(rootVal, leftTree, rightTree)

}
}