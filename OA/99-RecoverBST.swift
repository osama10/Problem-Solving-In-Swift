/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func findElementsToSwap(_ arr: [Int]) -> (first: Int, second: Int) {
        var first = Int.max
        var second = Int.max
        
        for i in 0..<arr.count-1 {
            if arr[i + 1] < arr[i] {
                second = i + 1
                if first == Int.max {
                    first = i
                } else {
                    break
                }
            }
        }
        
        return (arr[second], arr[first])
    }
    
    func inorder(_ root: TreeNode?, _ arr: inout [Int]) {
        guard let root = root else { return }
        inorder(root.left, &arr)
        arr.append(root.val)
        inorder(root.right, &arr)
    }
    
    func recoverTree(_ root: TreeNode?, _ x: Int, _ y: Int, _ count: Int) {
        guard let root = root else { return }
        var count = count
       
        if root.val == x || root.val == y {
            root.val = root.val == x ? y : x
            count -= 1
            if count == 0 {
                return 
            }
        }
        
        recoverTree(root.left, x, y, count)
        recoverTree(root.right, x, y, count)

    } 
    
    func recoverTree(_ root: TreeNode?) {
        var arr = [Int]()
        inorder(root, &arr)
        if !arr.isEmpty{
            let (x, y) = findElementsToSwap(arr)
            recoverTree(root, x, y, 2)
        }
    }
        
}