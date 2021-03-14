import Foundation

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


/// 1099 . Two Sum Less Than K (https://leetcode.com/problems/two-sum-less-than-k/): Given an array A of integers and integer K, return the maximum S such that there exists i < j with A[i] + A[j] = S and S < K. If no i, j exist satisfying this equation, return -1.

func twoSumLessThanK(_ arr: [Int], _ k: Int) -> Int {
    let arr = arr.sorted()
    var left = 0
    var right = arr.count - 1

    var maxSum = -1

    while left < right {
        let sum = arr[left] + arr[right]
        if sum < k {
            maxSum = max(sum, maxSum)
            left += 1
        } else { right -= 1 }
    }

    return maxSum
}

twoSumLessThanK([ 20, 10, 30, 100, 110 ], 85)
twoSumLessThanK([ 20, 10, 30, 100, 110 ], 20)



func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anamgramList = [String: [String]]()
    for str in strs {
        let sortedStr = String(str.sorted())
        anamgramList[sortedStr, default: [String]()].append(str)
    }
    return anamgramList.values.map{ $0 }
}

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    if s.isEmpty { return true }
    let sArray = Array(s)
    let set = Set<String>(wordDict)
    var result = ""
    var segment = String(sArray[0])
    var alreadyApeared = Set<String>()

    for (ind, char) in sArray.enumerated() {
        if ind != 0 { segment.append(char) }
        if set.contains(segment), !alreadyApeared.contains(segment) {
            alreadyApeared.insert(segment)
            result.append(segment)
            segment = ""

        }
    }

    return result == s
}


wordBreak("aaaaaaa", ["aaaa","aaa"])
