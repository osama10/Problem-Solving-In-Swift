//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


/// 1 NormalTwo Sum

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
var dict = [Int: Int]()

for (index, value) in nums.enumerated() {
    if let firstIndex = dict[target - value] {
        return [firstIndex, index]
    }
    dict[value] = index
}

return []
}

/// 167 Two sum when sorted

func twoSumWhenSorted(_ numbers: [Int], _ target: Int) -> [Int] {
    var low = 0
    var high = numbers.count - 1

    while low < high {
        let sum = numbers[low] + numbers[high]
        if sum == target { return [low + 1, high + 1] }
        else if sum < target { low += 1 }
        else { high -= 1}
    }

    return []
}


/// 653 Two Sum - BST

func inorderTraversal(_ node: TreeNode?, _ sortedArray: inout[Int]) {
    guard let node = node else { return }
    inorderTraversal(node.left, &sortedArray)
    sortedArray.append(node.val)
    inorderTraversal(node.right, &sortedArray)
}

func checkTwoSumOnSortedArray(_ arr: [Int], _ target: Int) -> Bool {
    var low = 0
    var hi = arr.count - 1
    while low < hi {
        let sum = arr[low] + arr[hi]
        if sum == target { return true }
        else if sum < target { low += 1 }
        else { hi -= 1 }
    }

    return false
}

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil || (root?.left == nil && root?.right == nil) { return false }
        var sortedArray =  [Int]()
        inorderTraversal(root, &sortedArray)
        return checkTwoSumOnSortedArray(sortedArray, k)
}
