//: [Previous](@previous)

import Foundation

//var str = "Hello, playground"
//
////: 746
//func minCostClimbingStairs(_ cost: [Int]) -> Int {
//    var dp = Array(repeating: 0, count: cost.count)
//    dp[0] = cost[0]
//    dp[1] = cost[1]
//
//    for i in 2..<cost.count {
//        dp[i] = min(dp[i - 1] + cost[i], dp[i - 2] + cost[i])
//    }
//    return min(dp[cost.count - 2], dp[cost.count - 1])
//}
//
//
//minCostClimbingStairs([10, 15, 20])
//
//
//var results = [Int]()
///// https://www.educative.io/courses/grokking-dynamic-programming-patterns-for-coding-interviews/RM1BDv71V60
//func solveKnapSack(_ costs: [Int], _ profits: [Int], _ maxCost: Int) -> Int {
//    var dp = Array(repeating: Array(repeating: -1, count: maxCost + 1), count: profits.count)
//    return knapSackRecursive(&dp, maxCost: maxCost, index: 0, cost: costs, profits: profits)
//}
//
//
//func knapSackRecursive( _ dp: inout [[Int]], maxCost: Int, index: Int, cost: [Int], profits: [Int]) -> Int {
//
//    if index < 0 || index > profits.count - 1 { return 0 }
//
//    if dp[index][maxCost] != -1 { return dp[index][maxCost] }
//
//    var value1 = 0
//
//    if cost[index] <= maxCost {
//        value1 = profits[index] + knapSackRecursive(&dp, maxCost: maxCost - cost[index], index: index + 1, cost: cost, profits: profits)
//    }
//
//    let value2 = knapSackRecursive(&dp, maxCost: maxCost, index: index + 1, cost: cost, profits: profits)
//    dp[index][maxCost] = max(value1, value2)
//    return dp[index][maxCost]
//
//}
//
//
//solveKnapSack([1, 2, 3, 5], [1, 6, 10, 16], 7)
//print(results)
//solveKnapSack([10, 20, 30], [60, 100, 120], 50)
//
//
//func change(_ amount: Int, _ coins: [Int]) -> Int {
//    var dp = Array(repeating: -1, count: amount + 1)
//    return stairClimber(coins, amount, &dp)
//}
//
//func stairClimber(_ coins: [Int], _ amount : Int, _ dp: inout [Int]) -> Int {
//    if amount == 0  { return 1 }
//
//    if amount < 0 { return 0 }
//
//    if dp[amount] != -1 { return dp[amount] }
//
//    var newAmount = [Int]()
//    for coin in coins { newAmount.append(stairClimber(coins, amount - coin, &dp))  }
//    dp[amount] = newAmount.reduce(0, +)
//    return dp[amount]
//}
//
//
//change(5, [1,2,5])
//change(3, [2])
//change(10, [10])


//
//func longestIncreasingSubsequence(_ nums: [Int]) -> Int {
//    var lis = Array(repeating: 1, count: nums.count)
//
//    for i in 0..<nums.count {
//        for j in 0..<i {
//            if nums[i] > nums[j] && lis[i] < (lis[j] + 1) {
//                lis[i] = lis[j] + 1
//            }
//        }
//    }
//
//    return lis.max() ?? 1
//}
//
//
//
//longestIncreasingSubsequence([3, 10, 2, 1, 20])
//longestIncreasingSubsequence([3, 2])
//longestIncreasingSubsequence([50, 3, 10, 7, 40, 80])
//
//func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
//    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
//    let text1 = Array(text1), text2 = Array(text2)
//
//    for i in 0...text1.count {
//        for j in 0...text2.count {
//            if i == 0 || j == 0 { dp[i][j] = 0 }
//            else if text1[i - 1] == text2[j - 1] {
//                dp[i][j] = dp[i - 1][j-1] + 1
//            } else {
//                dp[i][j] = max(dp[i - 1][j], dp[i][j-1])
//            }
//        }
//    }
//
//    return dp[text1.count][text2.count]
//}
//
//longestCommonSubsequence("abcde", "ace")
//
//func lcsUtil( _ text1: Array<Character>, _ text2: Array<Character>, _ i : Int, _ j: Int, cache: inout [[Int]] ) -> Int {
//    if i == 0 || j == 0 { return 0 }
//    if cache[i][j] != -1 { return cache[i][j] }
//
//    if text1[i] == text2[j] {
//        cache[i][j] = 1 + lcsUtil(text1, text2, i - 1, j - 1, cache: &cache)
//        return  cache[i][j]
//    } else {
//        cache[i][j] = max(lcsUtil(text1, text2, i - 1, j, cache: &cache), lcsUtil(text1, text2, i, j - 1, cache: &cache)  )
//        return  cache[i][j]
//    }
//}
//
//
//func longestPalindrome(_ s: String) -> String {
//    let arr1 = Array(s)
//    let arr2 = Array(s.reversed())
//    var dp = Array(repeating: Array(repeating: "", count: s.count + 1), count: s.count + 1)
//
//    for i in 0...s.count {
//        for j in 0...s.count {
//            if i == 0 || j == 0 { dp[i][j] = "" }
//            else if arr1[i - 1] == arr2[j - 1 ] && i == j { dp[i][j] = dp[i - 1][j - 1] + String(arr1[i - 1]) }
//            else { dp[i][j] = max(dp[i - 1][j] , dp[i][j - 1] )}
//        }
//    }
//
//    print(dp)
//    return dp[s.count][s.count]
//}
//
//longestPalindrome("ac")

///// 8.4 Power Set: Write a method to return all subsets of a set.
//
//func powerSet(arr: [Int]) -> [[Int]] {
//    var comb = [Int]()
//    var allComb = [[Int]]()
//    generate(arr: arr, comb: &comb, allComb: &allComb, start: 0)
//    return allComb
//}
//
//
//func generate(arr: [Int], comb: inout [Int], allComb: inout[[Int]], start: Int) {
//    allComb.append(comb)
//
//    for next in start..<arr.count {
//        comb.append(arr[next])
//        generate(arr: arr, comb: &comb, allComb: &allComb, start: next + 1)
//        comb.removeLast()
//    }
//
//}
//
//powerSet(arr: [1, 2])
//powerSet(arr: [1, 2, 3])

/// 4.1 Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route between two nodes.
//
//func hasRoute(_ source: Int, _ target: Int, graph: [[Int]]) -> Bool {
//    var visited = Set<Int>()
//    return depthFirstSearch(source, target, graph, &visited)
//}
//
//func depthFirstSearch(_ current: Int, _ target: Int, _ graph: [[Int]], _ visited: inout Set<Int>) -> Bool {
//    visited.insert(current)
//
//    if current == target { return true }
//
//    for neighbor in graph[current] {
//        if !visited.contains(neighbor) && depthFirstSearch(neighbor, target, graph, &visited) {
//            return true
//        }
//    }
//
//    visited.remove(current)
//    return false
//}
//
//let graph = [[1,2], [0], [3], [0], [5], [0]]
//
//
//print(hasRoute(3, 1, graph: graph))

/// 4.2 Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.

//func createMinimalTree(_ sortedArray: [Int]) -> TreeNode? {
//    if sortedArray.isEmpty { return nil }
//    return createBST(0, sortedArray.count - 1, sortedArray)
//}
//
//func createBST(_ lo: Int, _ hi: Int, _ array: [Int]) -> TreeNode? {
//    guard lo <= hi else { return nil }
//    let mid  = (lo + hi)/2
//    let value = array[mid]
//    let parent = TreeNode(value)
//    parent.left = createBST(lo, mid - 1, array)
//    parent.right = createBST(mid + 1, hi, array)
//    return parent
//}
//
//printLevelOrderTree(createMinimalTree([0,1,2,3,4,5]))
//
//func printLevelOrderTree(_ tree: TreeNode?) {
//    var queue = [tree!]
//    while !queue.isEmpty {
//        var child = [TreeNode]()
//        var level = [Int]()
//        queue.forEach { parent in
//            level.append(parent.val)
//            if let left = parent.left { child.append(left)}
//            if let right = parent.right { child.append(right)}
//        }
//        print(level)
//        queue = child
//    }
//}

/// 4.3 List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
//
//func levelOrderTraversal(tree: TreeNode) -> [ListNode] {
//    var queue = [TreeNode]()
//    queue.append(tree)
//    var result = [ListNode]()
//
//    while !queue.isEmpty {
//        var child = [TreeNode]()
//        var head: ListNode?
//        var current: ListNode?
//        queue.forEach { parent in
//            if head == nil {
//                head = ListNode(parent.val)
//                current = head
//            } else {
//                current?.next = ListNode(parent.val)
//                current = current?.next
//            }
//            if let left = parent.left { child.append(left)}
//            if let right = parent.right { child.append(right)}
//        }
//        result.append(head!)
//        queue = child
//    }
//
//    return result
//}
//
//func printList(listArr: [ListNode]) {
//    listArr.forEach { list in
//        var curr: ListNode? = list
//        var levels = [Int]()
//        while curr != nil {
//            levels.append(curr!.val)
//            curr = curr?.next
//        }
//        print(levels)
//    }
//}
//
//
//let root = TreeNode(2)
//let rootRight = TreeNode(4)
//let rootLeft = TreeNode(0)
//
//root.left = rootLeft
//
//let child0 = TreeNode(-1)
//let child1 = TreeNode(1)
//let child2 = TreeNode(3)
//let child3 = TreeNode(5)
//
//rootLeft.left = child0
//rootLeft.right = child1
//
//
//printList(listArr: levelOrderTraversal(tree: root))


/// 4.4 Check Balanced: Implement a function to check if a binary tree is balanced. For the purposes of this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.
//
//func isBalanced(root: TreeNode?) -> Int {
//    if root == nil { return 0 }
//
//    let leftHeight = isBalanced(root: root?.left)
//    if leftHeight == Int.min { return Int.min }
//
//    let rightHeight = isBalanced(root: root?.right)
//    if rightHeight == Int.min { return Int.min }
//
//    if abs(leftHeight - rightHeight) > 1 { return Int.min }
//
//
//    return max(rightHeight, leftHeight) + 1
//}
//
//let root = TreeNode(2)
//let rootRight = TreeNode(4)
//let rootLeft = TreeNode(0)
//
//root.left = rootLeft
//
//let child0 = TreeNode(-1)
//let child1 = TreeNode(1)
//let child2 = TreeNode(3)
//let child3 = TreeNode(5)
//
//rootLeft.left = child0
//rootLeft.right = child1
//
//
//print(isBalanced(root: root))


/// 4.5 Validate BST: Implement a function to check if a binary tree is a binary search tree.
//
//func isValidBST(_ tree: TreeNode?) -> Bool {
//
//    var nodeArray = [Int]()
//    inOrderTraversal(tree: tree, nodeArray: &nodeArray)
//
//    guard !nodeArray.isEmpty,
//           nodeArray.count > 1
//    else { return true }
//
//    for i in 1..<nodeArray.count {
//        if nodeArray[i - 1] >= nodeArray[i] { return false }
//    }
//
//    return true
//}
//
//func inOrderTraversal(tree: TreeNode?, nodeArray: inout [Int]) {
//    guard let tree = tree else { return }
//    inOrderTraversal(tree: tree.left, nodeArray: &nodeArray)
//    nodeArray.append(tree.val)
//    inOrderTraversal(tree: tree.right, nodeArray: &nodeArray)
//}
//
//func isValidBST(tree: TreeNode?) -> Bool {
//    checkForValidBST(tree: tree, min: nil, max: nil)
//}
//
//func checkForValidBST(tree: TreeNode?, min: Int?, max: Int?) -> Bool {
//    guard let tree = tree else { return true }
//
//    if (min != nil && min! >= tree.val ) || (max != nil && max! <= tree.val ) { return false }
//
//    let isLeftTreeValid = checkForValidBST(tree: tree.left, min: min, max: tree.val)
//    let isRightTreeValid = checkForValidBST(tree: tree.right, min: tree.val, max: max)
//
//    return isLeftTreeValid && isRightTreeValid
//
//}

/// 4.7 Build Order: You are given a list of projects and a list of dependencies (which is a list of pairs of projects,wherethesecondprojectisdependentonthefirstproject).Allofaproject'sdependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.
//
//func buildOrder(projects: [String], dependencies : [[String]]) -> [String] {
//    var dependencyGraph = [String: [String]]()
//    projects.forEach {  dependencyGraph[$0] = [] }
//    var inDegree = [String: Int]()
//    var projectOrder = [String]()
//    var stack = [String]()
//
//    dependencies.forEach { dependency in
//        let dependent = dependency[1]
//        let dependee = dependency[0]
//        dependencyGraph[dependee]?.append(dependent)
//        inDegree[dependent, default: 0] += 1
//    }
//
//    if inDegree.count == projects.count { return [] }
//
//    projects.forEach { project in
//        if inDegree[project, default: 0] == 0 {
//            stack.append(project)
//        }
//    }
//
//    while !stack.isEmpty {
//        let project = stack.removeFirst()
//        projectOrder.append(project)
//
//        for dependentProject in dependencyGraph[project]! {
//            inDegree[dependentProject, default: 0] -= 1
//
//            if inDegree[dependentProject, default: 0] == 0 {
//                stack.append(dependentProject)
//            }
//        }
//    }
//
//    return projectOrder.count == projects.count ? projectOrder : []
//}
//
//buildOrder(projects: ["a", "b", "c", "d", "e", "f" ],
//           dependencies: [["a", "d"], ["f", "b"], ["b", "d"], ["f", "a"], ["d","c"]])

/*
 You are climbing a staircase. It takes n steps to reach the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */

//func climbStairs(_ n: Int) -> Int {
//    guard n > 2 else { return n == 0 ? 0 : n }
//    var numberOfWays = Array(repeating: 0, count: n + 1)
//    numberOfWays[1] = 1
//    numberOfWays[2] = 2
//
//    for steps in 3...n {
//        numberOfWays[steps] = numberOfWays[steps - 1] + numberOfWays[steps - 2]
//    }
//
//    return numberOfWays[n]
//}
//
//climbStairs(5)


//func knapsack(_ profit: [Int],
//              _ weights: [Int],
//              _ totalWeight: Int,
//              _ index: Int,
//              _ memo: inout[[Int]]) -> Int {
//
//    if totalWeight == 0 || index == 0 { return 0 }
//    if memo[index][totalWeight] != -1 { return memo[index][totalWeight] }
//
//    if weights[index - 1] > totalWeight {
//        memo[index][totalWeight] = knapsack(profit, weights, totalWeight, index - 1, &memo)
//
//        return memo[index][totalWeight]
//    }
//
//    memo[index][totalWeight] =  max(
//    knapsack(profit, weights, totalWeight, index - 1, &memo),
//        profit[index - 1] + knapsack(profit, weights, totalWeight - weights[index - 1], index - 1, &memo))
//
//    return memo[index][totalWeight]
//
//}
//
//var memo = Array(repeating: Array(repeating: -1, count: 51), count: 4)
//knapsack([ 60, 100, 120 ], [ 10, 20, 30 ], 50, 3, &memo)

//func subsetSum(_ set: [Int],
//               _ sum: Int,
//               _ index: Int,
//               _ memo: inout[[Bool?]]) -> Bool {
//
//    if index <= 0 { return false }
//    if sum == 0 { return true }
//
//    if let result = memo[index][sum]  { return result }
//    if set[index - 1] > sum {
//        memo[index][sum] = subsetSum(set, sum, index - 1, &memo)
//        return memo[index][sum]!
//    }
//
//    memo[index][sum] = subsetSum(set, sum, index - 1, &memo) ||
//                       subsetSum(set, sum - set[index - 1], index - 1, &memo)
//
//    return memo[index][sum]!
//}
//
//let set = [3, 34, 4, 12, 5, 2]
//let sum = 30
//
//var memo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: sum + 1),
//                            count: set.count + 1)
//
//subsetSum(set, sum, set.count, &memo)
//
//func canPartition(_ nums: [Int]) -> Bool {
//    let sum = nums.reduce(0, +)
//
//    if sum % 2 != 0 { return false } // if odd, return false
//
//    var memo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: sum/2 + 1),
//                                count: nums.count + 1)
//
//    return subsetSum(nums, sum/2, nums.count, &memo)
//}
//
//
//func countSubset(_ arr: [Int],
//                 _ targetSum: Int,
//                 _ n: Int,
//                 _ memo: inout [[Int]]) -> Int {
//
//    if targetSum == 0 { return 1 }
//    if n == 0 { return 0 }
//    if memo[n][targetSum] != -1 { return memo[n][targetSum] }
//
//    if arr[n - 1] > targetSum {
//        memo[n][targetSum] = countSubset(arr, targetSum, n - 1 , &memo)
//        return memo[n][targetSum]
//    }
//
//    memo[n][targetSum] = countSubset(arr, targetSum, n - 1 , &memo) +
//        countSubset(arr, targetSum - arr[n - 1], n - 1 , &memo)
//
//    return memo[n][targetSum]
//
//}
//
//func countSubsetSum(_ arr: [Int], _ targetSum: Int) -> Int {
//    var memo = Array(repeating: Array(repeating: -1, count: targetSum + 1),
//                     count: arr.count + 1)
//    return countSubset(arr, targetSum, arr.count, &memo)
//}
//
//countSubsetSum([1, 1, 1, 1], 1)
//
//
//func findMinSubsetDiff(_ arr: [Int],
//                       _ totalSum: Int,
//                       _ calSum: Int,
//                       _ n: Int,
//                       _ memo: inout [[Int]]) -> Int {
//
//    if  n == 0 { return abs((totalSum - calSum) - calSum) }
//
//    if memo[n][calSum] != -1 { return memo[n][calSum] }
//
//    let sumWithN = findMinSubsetDiff(arr, totalSum, calSum + arr[n - 1], n - 1, &memo)
//    let sumWithOutN = findMinSubsetDiff(arr, totalSum, calSum , n - 1, &memo)
//
//    memo[n][calSum] = min(sumWithN, sumWithOutN)
//
//    return memo[n][calSum]
//
//}
//
//
//func minSubDiffernece(_ arr: [Int]) -> Int {
//    let totalSum = arr.reduce(0, +)
//    var memo = Array(repeating: Array(repeating: -1, count: totalSum + 1),
//                     count: arr.count + 1)
//    return findMinSubsetDiff(arr, totalSum, 0,arr.count, &memo)
//}
//
//minSubDiffernece([1, 6, 11, 5])
//
//func calculateWays(_ nums: [Int],
//                   _ target: Int,
//                   _ currentSum: Int,
//                   _ n: Int,
//                   _ total: Int,
//                   _ memo: inout [[Int]]) -> Int {
//
//    if n == 0 {
//        return target == currentSum ? 1 : 0
//    }
//
//    if memo[n][currentSum + total] != -1 { return memo[n][currentSum + total] }
//
//    memo[n][currentSum + total] = calculateWays(nums,
//                                                target,
//                                                currentSum + nums[n - 1],
//                                                n - 1,
//                                                total,
//                                                &memo) + calculateWays(nums,
//                                                                       target,
//                                                                       currentSum - nums[n - 1],
//                                                                       n - 1,
//                                                                       total,
//                                                                       &memo)
//
//    return memo[n][currentSum + total]
//
//}
//
//func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
//    let total = nums.reduce(0, +)
//    var memo = Array(repeating: Array(repeating: -1, count: 2 * total + 1), count: nums.count + 1)
//    return calculateWays(nums, target, 0, nums.count, total, &memo)
//}
//
//findTargetSumWays([1], 1)

/*
 Given two integer arrays to represent weights and profits of ‘N’ items, we need to find a subset of these items which will give us maximum profit such that their cumulative weight is not more than a given number ‘C’. We can assume an infinite supply of item quantities; therefore, each item can be selected multiple times.
 */

func unboundedKnapsack(profits: [Int],
                       weights: [Int],
                       maxWeight: Int) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: maxWeight + 1), count: profits.count + 1)
    
    return calculateMaxProfit(profits, weights, maxWeight, profits.count, &memo)
}

func calculateMaxProfit(_ profits: [Int],
                        _ weights: [Int],
                        _ maxWeight: Int,
                        _ n: Int,
                        _ memo: inout [[Int]]) -> Int {
    
    if n == 0 || maxWeight <= 0 {
        return 0
    }
    
    if memo[n][maxWeight] == -1 {
        var profit1 = 0
        
        if weights[n - 1] <= maxWeight {
            profit1 = profits[n - 1] + calculateMaxProfit(profits, weights, maxWeight - weights[n - 1], n, &memo)
        }
        
        let profit2 = calculateMaxProfit(profits, weights, maxWeight , n - 1, &memo)
        
        memo[n][maxWeight] = max(profit1, profit2)
    }
    
    return memo[n][maxWeight]
}

unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], maxWeight: 8)// 140
unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], maxWeight: 6) // 105
unboundedKnapsack(profits: [10, 30, 20], weights: [5, 10, 15], maxWeight: 100) // 300
unboundedKnapsack(profits: [1, 30], weights: [1, 50], maxWeight: 100) // 100
unboundedKnapsack(profits: [10, 40, 50, 70], weights: [1, 3, 4, 5], maxWeight: 8) // 110

/*
 Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.

 Return the maximum product you can get.
 
 Example 1:

 Input: n = 2
 Output: 1
 Explanation: 2 = 1 + 1, 1 × 1 = 1.
 
 Example 2:

 Input: n = 10
 Output: 36
 Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
 */

func integerBreak(_ n: Int) -> Int {
    var dp = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    
    for i in 1...n {
        for j in 1..<i {
            let a = (i - j) * j
            let b = dp[(i - j)] * j
            dp[i] = max(dp[i], a, b)
        }
    }
    
    return dp[n]
}


integerBreak(10) // 36

func change(_ amount: Int, _ coins: [Int]) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
    return calculateMinNumbers(coins, amount, coins.count, &memo)
    
}


func calculateMinNumbers(_ coins: [Int],
                         _ amount: Int,
                         _ n: Int,
                         _ memo: inout [[Int]]) -> Int {
    if amount == 0 {
        return 1
    }
    
    if n == 0 {
        return 0
    }
    
    if memo[n][amount] == -1 {
        var totalCountWithN = 0
        
        if coins[n - 1] <= amount {
            totalCountWithN = calculateMinNumbers(coins, amount - coins[n - 1], n, &memo)
        }
        
        let totalCountWithoutN = calculateMinNumbers(coins, amount, n - 1, &memo)
        
        memo[n][amount] = totalCountWithN + totalCountWithoutN
    }
    
    return memo[n][amount]
    
}


change(10, [10])


func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
    let totalWays = calculateMinWays(coins, amount, coins.count, &memo)
    return totalWays == Int.max ? -1 : totalWays
}

func calculateMinWays(_ coins: [Int], _ amount: Int, _ n: Int, _ memo: inout [[Int]]) -> Int {
   
    if amount == 0 {
        return 0
    }
    
    if n == 0 {
        return Int.max
    }
    
    if memo[n][amount] == -1 {
        var waysWithN = Int.max
        if coins[n - 1] <= amount {
            let res = calculateMinWays(coins, amount - coins[n - 1], n, &memo)
            if res != Int.max {
                waysWithN = res + 1
            }
        }
        
        let waysWithoutN = calculateMinWays(coins, amount, n - 1, &memo)
        memo[n][amount] = min(waysWithN, waysWithoutN)
    }
    
    return memo[n][amount]
}

coinChange([1, 2, 3], 5)
coinChange([1, 2, 3], 11)
coinChange([1, 2, 3], 7)
coinChange([3, 5], 7)
coinChange([2,5,10,1], 27)
