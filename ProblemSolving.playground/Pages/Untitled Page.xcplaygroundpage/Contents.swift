////: [Previous](@previous)
//
//import Foundation
//
////var str = "Hello, playground"
////
//////: 746
////func minCostClimbingStairs(_ cost: [Int]) -> Int {
////    var dp = Array(repeating: 0, count: cost.count)
////    dp[0] = cost[0]
////    dp[1] = cost[1]
////
////    for i in 2..<cost.count {
////        dp[i] = min(dp[i - 1] + cost[i], dp[i - 2] + cost[i])
////    }
////    return min(dp[cost.count - 2], dp[cost.count - 1])
////}
////
////
////minCostClimbingStairs([10, 15, 20])
////
////
////var results = [Int]()
/////// https://www.educative.io/courses/grokking-dynamic-programming-patterns-for-coding-interviews/RM1BDv71V60
////func solveKnapSack(_ costs: [Int], _ profits: [Int], _ maxCost: Int) -> Int {
////    var dp = Array(repeating: Array(repeating: -1, count: maxCost + 1), count: profits.count)
////    return knapSackRecursive(&dp, maxCost: maxCost, index: 0, cost: costs, profits: profits)
////}
////
////
////func knapSackRecursive( _ dp: inout [[Int]], maxCost: Int, index: Int, cost: [Int], profits: [Int]) -> Int {
////
////    if index < 0 || index > profits.count - 1 { return 0 }
////
////    if dp[index][maxCost] != -1 { return dp[index][maxCost] }
////
////    var value1 = 0
////
////    if cost[index] <= maxCost {
////        value1 = profits[index] + knapSackRecursive(&dp, maxCost: maxCost - cost[index], index: index + 1, cost: cost, profits: profits)
////    }
////
////    let value2 = knapSackRecursive(&dp, maxCost: maxCost, index: index + 1, cost: cost, profits: profits)
////    dp[index][maxCost] = max(value1, value2)
////    return dp[index][maxCost]
////
////}
////
////
////solveKnapSack([1, 2, 3, 5], [1, 6, 10, 16], 7)
////print(results)
////solveKnapSack([10, 20, 30], [60, 100, 120], 50)
////
////
////func change(_ amount: Int, _ coins: [Int]) -> Int {
////    var dp = Array(repeating: -1, count: amount + 1)
////    return stairClimber(coins, amount, &dp)
////}
////
////func stairClimber(_ coins: [Int], _ amount : Int, _ dp: inout [Int]) -> Int {
////    if amount == 0  { return 1 }
////
////    if amount < 0 { return 0 }
////
////    if dp[amount] != -1 { return dp[amount] }
////
////    var newAmount = [Int]()
////    for coin in coins { newAmount.append(stairClimber(coins, amount - coin, &dp))  }
////    dp[amount] = newAmount.reduce(0, +)
////    return dp[amount]
////}
////
////
////change(5, [1,2,5])
////change(3, [2])
////change(10, [10])
//
//
////
////func longestIncreasingSubsequence(_ nums: [Int]) -> Int {
////    var lis = Array(repeating: 1, count: nums.count)
////
////    for i in 0..<nums.count {
////        for j in 0..<i {
////            if nums[i] > nums[j] && lis[i] < (lis[j] + 1) {
////                lis[i] = lis[j] + 1
////            }
////        }
////    }
////
////    return lis.max() ?? 1
////}
////
////
////
////longestIncreasingSubsequence([3, 10, 2, 1, 20])
////longestIncreasingSubsequence([3, 2])
////longestIncreasingSubsequence([50, 3, 10, 7, 40, 80])
////
////func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
////    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
////    let text1 = Array(text1), text2 = Array(text2)
////
////    for i in 0...text1.count {
////        for j in 0...text2.count {
////            if i == 0 || j == 0 { dp[i][j] = 0 }
////            else if text1[i - 1] == text2[j - 1] {
////                dp[i][j] = dp[i - 1][j-1] + 1
////            } else {
////                dp[i][j] = max(dp[i - 1][j], dp[i][j-1])
////            }
////        }
////    }
////
////    return dp[text1.count][text2.count]
////}
////
////longestCommonSubsequence("abcde", "ace")
////
////func lcsUtil( _ text1: Array<Character>, _ text2: Array<Character>, _ i : Int, _ j: Int, cache: inout [[Int]] ) -> Int {
////    if i == 0 || j == 0 { return 0 }
////    if cache[i][j] != -1 { return cache[i][j] }
////
////    if text1[i] == text2[j] {
////        cache[i][j] = 1 + lcsUtil(text1, text2, i - 1, j - 1, cache: &cache)
////        return  cache[i][j]
////    } else {
////        cache[i][j] = max(lcsUtil(text1, text2, i - 1, j, cache: &cache), lcsUtil(text1, text2, i, j - 1, cache: &cache)  )
////        return  cache[i][j]
////    }
////}
////
////
////func longestPalindrome(_ s: String) -> String {
////    let arr1 = Array(s)
////    let arr2 = Array(s.reversed())
////    var dp = Array(repeating: Array(repeating: "", count: s.count + 1), count: s.count + 1)
////
////    for i in 0...s.count {
////        for j in 0...s.count {
////            if i == 0 || j == 0 { dp[i][j] = "" }
////            else if arr1[i - 1] == arr2[j - 1 ] && i == j { dp[i][j] = dp[i - 1][j - 1] + String(arr1[i - 1]) }
////            else { dp[i][j] = max(dp[i - 1][j] , dp[i][j - 1] )}
////        }
////    }
////
////    print(dp)
////    return dp[s.count][s.count]
////}
////
////longestPalindrome("ac")
//
/////// 8.4 Power Set: Write a method to return all subsets of a set.
////
////func powerSet(arr: [Int]) -> [[Int]] {
////    var comb = [Int]()
////    var allComb = [[Int]]()
////    generate(arr: arr, comb: &comb, allComb: &allComb, start: 0)
////    return allComb
////}
////
////
////func generate(arr: [Int], comb: inout [Int], allComb: inout[[Int]], start: Int) {
////    allComb.append(comb)
////
////    for next in start..<arr.count {
////        comb.append(arr[next])
////        generate(arr: arr, comb: &comb, allComb: &allComb, start: next + 1)
////        comb.removeLast()
////    }
////
////}
////
////powerSet(arr: [1, 2])
////powerSet(arr: [1, 2, 3])
//
///// 4.1 Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route between two nodes.
////
////func hasRoute(_ source: Int, _ target: Int, graph: [[Int]]) -> Bool {
////    var visited = Set<Int>()
////    return depthFirstSearch(source, target, graph, &visited)
////}
////
////func depthFirstSearch(_ current: Int, _ target: Int, _ graph: [[Int]], _ visited: inout Set<Int>) -> Bool {
////    visited.insert(current)
////
////    if current == target { return true }
////
////    for neighbor in graph[current] {
////        if !visited.contains(neighbor) && depthFirstSearch(neighbor, target, graph, &visited) {
////            return true
////        }
////    }
////
////    visited.remove(current)
////    return false
////}
////
////let graph = [[1,2], [0], [3], [0], [5], [0]]
////
////
////print(hasRoute(3, 1, graph: graph))
//
///// 4.2 Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.
//
////func createMinimalTree(_ sortedArray: [Int]) -> TreeNode? {
////    if sortedArray.isEmpty { return nil }
////    return createBST(0, sortedArray.count - 1, sortedArray)
////}
////
////func createBST(_ lo: Int, _ hi: Int, _ array: [Int]) -> TreeNode? {
////    guard lo <= hi else { return nil }
////    let mid  = (lo + hi)/2
////    let value = array[mid]
////    let parent = TreeNode(value)
////    parent.left = createBST(lo, mid - 1, array)
////    parent.right = createBST(mid + 1, hi, array)
////    return parent
////}
////
////printLevelOrderTree(createMinimalTree([0,1,2,3,4,5]))
////
////func printLevelOrderTree(_ tree: TreeNode?) {
////    var queue = [tree!]
////    while !queue.isEmpty {
////        var child = [TreeNode]()
////        var level = [Int]()
////        queue.forEach { parent in
////            level.append(parent.val)
////            if let left = parent.left { child.append(left)}
////            if let right = parent.right { child.append(right)}
////        }
////        print(level)
////        queue = child
////    }
////}
//
///// 4.3 List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
////
////func levelOrderTraversal(tree: TreeNode) -> [ListNode] {
////    var queue = [TreeNode]()
////    queue.append(tree)
////    var result = [ListNode]()
////
////    while !queue.isEmpty {
////        var child = [TreeNode]()
////        var head: ListNode?
////        var current: ListNode?
////        queue.forEach { parent in
////            if head == nil {
////                head = ListNode(parent.val)
////                current = head
////            } else {
////                current?.next = ListNode(parent.val)
////                current = current?.next
////            }
////            if let left = parent.left { child.append(left)}
////            if let right = parent.right { child.append(right)}
////        }
////        result.append(head!)
////        queue = child
////    }
////
////    return result
////}
////
////func printList(listArr: [ListNode]) {
////    listArr.forEach { list in
////        var curr: ListNode? = list
////        var levels = [Int]()
////        while curr != nil {
////            levels.append(curr!.val)
////            curr = curr?.next
////        }
////        print(levels)
////    }
////}
////
////
////let root = TreeNode(2)
////let rootRight = TreeNode(4)
////let rootLeft = TreeNode(0)
////
////root.left = rootLeft
////
////let child0 = TreeNode(-1)
////let child1 = TreeNode(1)
////let child2 = TreeNode(3)
////let child3 = TreeNode(5)
////
////rootLeft.left = child0
////rootLeft.right = child1
////
////
////printList(listArr: levelOrderTraversal(tree: root))
//
//
///// 4.4 Check Balanced: Implement a function to check if a binary tree is balanced. For the purposes of this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.
////
////func isBalanced(root: TreeNode?) -> Int {
////    if root == nil { return 0 }
////
////    let leftHeight = isBalanced(root: root?.left)
////    if leftHeight == Int.min { return Int.min }
////
////    let rightHeight = isBalanced(root: root?.right)
////    if rightHeight == Int.min { return Int.min }
////
////    if abs(leftHeight - rightHeight) > 1 { return Int.min }
////
////
////    return max(rightHeight, leftHeight) + 1
////}
////
////let root = TreeNode(2)
////let rootRight = TreeNode(4)
////let rootLeft = TreeNode(0)
////
////root.left = rootLeft
////
////let child0 = TreeNode(-1)
////let child1 = TreeNode(1)
////let child2 = TreeNode(3)
////let child3 = TreeNode(5)
////
////rootLeft.left = child0
////rootLeft.right = child1
////
////
////print(isBalanced(root: root))
//
//
///// 4.5 Validate BST: Implement a function to check if a binary tree is a binary search tree.
////
////func isValidBST(_ tree: TreeNode?) -> Bool {
////
////    var nodeArray = [Int]()
////    inOrderTraversal(tree: tree, nodeArray: &nodeArray)
////
////    guard !nodeArray.isEmpty,
////           nodeArray.count > 1
////    else { return true }
////
////    for i in 1..<nodeArray.count {
////        if nodeArray[i - 1] >= nodeArray[i] { return false }
////    }
////
////    return true
////}
////
////func inOrderTraversal(tree: TreeNode?, nodeArray: inout [Int]) {
////    guard let tree = tree else { return }
////    inOrderTraversal(tree: tree.left, nodeArray: &nodeArray)
////    nodeArray.append(tree.val)
////    inOrderTraversal(tree: tree.right, nodeArray: &nodeArray)
////}
////
////func isValidBST(tree: TreeNode?) -> Bool {
////    checkForValidBST(tree: tree, min: nil, max: nil)
////}
////
////func checkForValidBST(tree: TreeNode?, min: Int?, max: Int?) -> Bool {
////    guard let tree = tree else { return true }
////
////    if (min != nil && min! >= tree.val ) || (max != nil && max! <= tree.val ) { return false }
////
////    let isLeftTreeValid = checkForValidBST(tree: tree.left, min: min, max: tree.val)
////    let isRightTreeValid = checkForValidBST(tree: tree.right, min: tree.val, max: max)
////
////    return isLeftTreeValid && isRightTreeValid
////
////}
//
///// 4.7 Build Order: You are given a list of projects and a list of dependencies (which is a list of pairs of projects,wherethesecondprojectisdependentonthefirstproject).Allofaproject'sdependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.
////
////func buildOrder(projects: [String], dependencies : [[String]]) -> [String] {
////    var dependencyGraph = [String: [String]]()
////    projects.forEach {  dependencyGraph[$0] = [] }
////    var inDegree = [String: Int]()
////    var projectOrder = [String]()
////    var stack = [String]()
////
////    dependencies.forEach { dependency in
////        let dependent = dependency[1]
////        let dependee = dependency[0]
////        dependencyGraph[dependee]?.append(dependent)
////        inDegree[dependent, default: 0] += 1
////    }
////
////    if inDegree.count == projects.count { return [] }
////
////    projects.forEach { project in
////        if inDegree[project, default: 0] == 0 {
////            stack.append(project)
////        }
////    }
////
////    while !stack.isEmpty {
////        let project = stack.removeFirst()
////        projectOrder.append(project)
////
////        for dependentProject in dependencyGraph[project]! {
////            inDegree[dependentProject, default: 0] -= 1
////
////            if inDegree[dependentProject, default: 0] == 0 {
////                stack.append(dependentProject)
////            }
////        }
////    }
////
////    return projectOrder.count == projects.count ? projectOrder : []
////}
////
////buildOrder(projects: ["a", "b", "c", "d", "e", "f" ],
////           dependencies: [["a", "d"], ["f", "b"], ["b", "d"], ["f", "a"], ["d","c"]])
//
///*
// You are climbing a staircase. It takes n steps to reach the top.
//
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
// */
//
////func climbStairs(_ n: Int) -> Int {
////    guard n > 2 else { return n == 0 ? 0 : n }
////    var numberOfWays = Array(repeating: 0, count: n + 1)
////    numberOfWays[1] = 1
////    numberOfWays[2] = 2
////
////    for steps in 3...n {
////        numberOfWays[steps] = numberOfWays[steps - 1] + numberOfWays[steps - 2]
////    }
////
////    return numberOfWays[n]
////}
////
////climbStairs(5)
//
//
////func knapsack(_ profit: [Int],
////              _ weights: [Int],
////              _ totalWeight: Int,
////              _ index: Int,
////              _ memo: inout[[Int]]) -> Int {
////
////    if totalWeight == 0 || index == 0 { return 0 }
////    if memo[index][totalWeight] != -1 { return memo[index][totalWeight] }
////
////    if weights[index - 1] > totalWeight {
////        memo[index][totalWeight] = knapsack(profit, weights, totalWeight, index - 1, &memo)
////
////        return memo[index][totalWeight]
////    }
////
////    memo[index][totalWeight] =  max(
////    knapsack(profit, weights, totalWeight, index - 1, &memo),
////        profit[index - 1] + knapsack(profit, weights, totalWeight - weights[index - 1], index - 1, &memo))
////
////    return memo[index][totalWeight]
////
////}
////
////var memo = Array(repeating: Array(repeating: -1, count: 51), count: 4)
////knapsack([ 60, 100, 120 ], [ 10, 20, 30 ], 50, 3, &memo)
//
////func subsetSum(_ set: [Int],
////               _ sum: Int,
////               _ index: Int,
////               _ memo: inout[[Bool?]]) -> Bool {
////
////    if index <= 0 { return false }
////    if sum == 0 { return true }
////
////    if let result = memo[index][sum]  { return result }
////    if set[index - 1] > sum {
////        memo[index][sum] = subsetSum(set, sum, index - 1, &memo)
////        return memo[index][sum]!
////    }
////
////    memo[index][sum] = subsetSum(set, sum, index - 1, &memo) ||
////                       subsetSum(set, sum - set[index - 1], index - 1, &memo)
////
////    return memo[index][sum]!
////}
////
////let set = [3, 34, 4, 12, 5, 2]
////let sum = 30
////
////var memo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: sum + 1),
////                            count: set.count + 1)
////
////subsetSum(set, sum, set.count, &memo)
////
////func canPartition(_ nums: [Int]) -> Bool {
////    let sum = nums.reduce(0, +)
////
////    if sum % 2 != 0 { return false } // if odd, return false
////
////    var memo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: sum/2 + 1),
////                                count: nums.count + 1)
////
////    return subsetSum(nums, sum/2, nums.count, &memo)
////}
////
////
////func countSubset(_ arr: [Int],
////                 _ targetSum: Int,
////                 _ n: Int,
////                 _ memo: inout [[Int]]) -> Int {
////
////    if targetSum == 0 { return 1 }
////    if n == 0 { return 0 }
////    if memo[n][targetSum] != -1 { return memo[n][targetSum] }
////
////    if arr[n - 1] > targetSum {
////        memo[n][targetSum] = countSubset(arr, targetSum, n - 1 , &memo)
////        return memo[n][targetSum]
////    }
////
////    memo[n][targetSum] = countSubset(arr, targetSum, n - 1 , &memo) +
////        countSubset(arr, targetSum - arr[n - 1], n - 1 , &memo)
////
////    return memo[n][targetSum]
////
////}
////
////func countSubsetSum(_ arr: [Int], _ targetSum: Int) -> Int {
////    var memo = Array(repeating: Array(repeating: -1, count: targetSum + 1),
////                     count: arr.count + 1)
////    return countSubset(arr, targetSum, arr.count, &memo)
////}
////
////countSubsetSum([1, 1, 1, 1], 1)
////
////
////func findMinSubsetDiff(_ arr: [Int],
////                       _ totalSum: Int,
////                       _ calSum: Int,
////                       _ n: Int,
////                       _ memo: inout [[Int]]) -> Int {
////
////    if  n == 0 { return abs((totalSum - calSum) - calSum) }
////
////    if memo[n][calSum] != -1 { return memo[n][calSum] }
////
////    let sumWithN = findMinSubsetDiff(arr, totalSum, calSum + arr[n - 1], n - 1, &memo)
////    let sumWithOutN = findMinSubsetDiff(arr, totalSum, calSum , n - 1, &memo)
////
////    memo[n][calSum] = min(sumWithN, sumWithOutN)
////
////    return memo[n][calSum]
////
////}
////
////
////func minSubDiffernece(_ arr: [Int]) -> Int {
////    let totalSum = arr.reduce(0, +)
////    var memo = Array(repeating: Array(repeating: -1, count: totalSum + 1),
////                     count: arr.count + 1)
////    return findMinSubsetDiff(arr, totalSum, 0,arr.count, &memo)
////}
////
////minSubDiffernece([1, 6, 11, 5])
////
////func calculateWays(_ nums: [Int],
////                   _ target: Int,
////                   _ currentSum: Int,
////                   _ n: Int,
////                   _ total: Int,
////                   _ memo: inout [[Int]]) -> Int {
////
////    if n == 0 {
////        return target == currentSum ? 1 : 0
////    }
////
////    if memo[n][currentSum + total] != -1 { return memo[n][currentSum + total] }
////
////    memo[n][currentSum + total] = calculateWays(nums,
////                                                target,
////                                                currentSum + nums[n - 1],
////                                                n - 1,
////                                                total,
////                                                &memo) + calculateWays(nums,
////                                                                       target,
////                                                                       currentSum - nums[n - 1],
////                                                                       n - 1,
////                                                                       total,
////                                                                       &memo)
////
////    return memo[n][currentSum + total]
////
////}
////
////func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
////    let total = nums.reduce(0, +)
////    var memo = Array(repeating: Array(repeating: -1, count: 2 * total + 1), count: nums.count + 1)
////    return calculateWays(nums, target, 0, nums.count, total, &memo)
////}
////
////findTargetSumWays([1], 1)
//
///*
// Given two integer arrays to represent weights and profits of ‘N’ items, we need to find a subset of these items which will give us maximum profit such that their cumulative weight is not more than a given number ‘C’. We can assume an infinite supply of item quantities; therefore, each item can be selected multiple times.
// */
//
////func unboundedKnapsack(profits: [Int],
////                       weights: [Int],
////                       maxWeight: Int) -> Int {
////    var memo = Array(repeating: Array(repeating: -1, count: maxWeight + 1), count: profits.count + 1)
////
////    return calculateMaxProfit(profits, weights, maxWeight, profits.count, &memo)
////}
////
////func calculateMaxProfit(_ profits: [Int],
////                        _ weights: [Int],
////                        _ maxWeight: Int,
////                        _ n: Int,
////                        _ memo: inout [[Int]]) -> Int {
////
////    if n == 0 || maxWeight <= 0 {
////        return 0
////    }
////
////    if memo[n][maxWeight] == -1 {
////        var profit1 = 0
////
////        if weights[n - 1] <= maxWeight {
////            profit1 = profits[n - 1] + calculateMaxProfit(profits, weights, maxWeight - weights[n - 1], n, &memo)
////        }
////
////        let profit2 = calculateMaxProfit(profits, weights, maxWeight , n - 1, &memo)
////
////        memo[n][maxWeight] = max(profit1, profit2)
////    }
////
////    return memo[n][maxWeight]
////}
////
////unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], maxWeight: 8)// 140
////unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], maxWeight: 6) // 105
////unboundedKnapsack(profits: [10, 30, 20], weights: [5, 10, 15], maxWeight: 100) // 300
////unboundedKnapsack(profits: [1, 30], weights: [1, 50], maxWeight: 100) // 100
////unboundedKnapsack(profits: [10, 40, 50, 70], weights: [1, 3, 4, 5], maxWeight: 8) // 110
////
/////*
//// Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.
////
//// Return the maximum product you can get.
////
//// Example 1:
////
//// Input: n = 2
//// Output: 1
//// Explanation: 2 = 1 + 1, 1 × 1 = 1.
////
//// Example 2:
////
//// Input: n = 10
//// Output: 36
//// Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
//// */
////
////func integerBreak(_ n: Int) -> Int {
////    var dp = Array(repeating: 0, count: n + 1)
////    dp[1] = 1
////
////    for i in 1...n {
////        for j in 1..<i {
////            let a = (i - j) * j
////            let b = dp[(i - j)] * j
////            dp[i] = max(dp[i], a, b)
////        }
////    }
////
////    return dp[n]
////}
////
////
////integerBreak(10) // 36
////
////
////func coinChange(_ coins: [Int], _ amount: Int) -> Int {
////    var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
////    let totalWays = calculateMinWays(coins, amount, coins.count, &memo)
////    return totalWays == Int.max ? -1 : totalWays
////}
////
////func calculateMinWays(_ coins: [Int], _ amount: Int, _ n: Int, _ memo: inout [[Int]]) -> Int {
////
////    if amount == 0 {
////        return 0
////    }
////
////    if n == 0 {
////        return Int.max
////    }
////
////    if memo[n][amount] == -1 {
////        var waysWithN = Int.max
////        if coins[n - 1] <= amount {
////            let res = calculateMinWays(coins, amount - coins[n - 1], n, &memo)
////            if res != Int.max {
////                waysWithN = res + 1
////            }
////        }
////
////        let waysWithoutN = calculateMinWays(coins, amount, n - 1, &memo)
////        memo[n][amount] = min(waysWithN, waysWithoutN)
////    }
////
////    return memo[n][amount]
////}
////
////coinChange([1, 2, 3], 5)
////coinChange([1, 2, 3], 11)
////coinChange([1, 2, 3], 7)
////coinChange([3, 5], 7)
////coinChange([2,5,10,1], 27)
////
////func calculateAllCombinations(_ nums: [Int],
////                         _ target: Int,
////                         _ memo: inout [Int]) -> Int {
////    if target == 0 {
////        return 1
////    }
////
////    if memo[target] != -1 { return memo[target] }
////
////
////    var res = 0
////
////    for (num) in nums {
////            if target >= num {
////               res += calculateAllCombinations(nums, target - num, &memo)
////            }
////
////        }
////
////    memo[target] = res
////    return memo[target]
////
////}
//
////func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
////    var memo = Array(repeating: -1, count: target + 1)
////    return calculateAllCombinations(nums, target, &memo)
////}
////
////combinationSum4([1,2,3], 4)
////combinationSum4([9], 3)
////
//
//
////func knapsack(_ profit: [Int], _ weights: [Int], _ capacity: Int) -> Int {
////    var memo = Array(repeating: Array(repeating: -1, count: capacity + 1), count: profit.count + 1)
////    return boundedKnapsack(profit, weights, capacity, profit.count ,&memo)
////}
////
////func boundedKnapsack(_ profit: [Int], _ weights: [Int], _ capacity: Int,_ n: Int, _ memo: inout [[Int]]) -> Int {
////
////    if n == 0 || capacity == 0 {
////        return 0
////    }
////
////    if memo[n][capacity] == -1 {
////        var profitWithN = Int.min
////
////        if weights[n - 1] <= capacity {
////            profitWithN = profit[n - 1] + boundedKnapsack(profit, weights, capacity - weights[n - 1], n - 1, &memo)
////        }
////
////        let profitWithoutN = boundedKnapsack(profit, weights, capacity, n - 1, &memo)
////
////        memo[n][capacity] = max(profitWithN, profitWithoutN)
////    }
////
////    return memo[n][capacity]
////}
////
////knapsack([ 1, 6, 10, 16 ], [ 1, 2, 3, 5 ], 7)
////knapsack([ 1, 6, 10, 16 ], [ 1, 2, 3, 5 ], 6)
////
////
////func canPartition(_ arr: [Int]) -> Bool {
////    let totalSum = arr.reduce(0, +)
////    guard totalSum % 2 == 0 else  { return false }
////    var memo : [[Bool?]] = Array(repeating: Array(repeating: nil , count: totalSum + 1) , count: arr.count + 1)
////    return subsetSum(arr, totalSum, arr.count, &memo)
////}
////
////func hasSum(_ arr: [Int], _ sum: Int) -> Bool {
////    var memo : [[Bool?]] = Array(repeating: Array(repeating: nil , count: sum + 1) , count: arr.count + 1)
////    return subsetSum(arr, sum, arr.count, &memo)
////}
////
////func subsetSum(_ arr: [Int], _ totalSum: Int, _ n: Int, _ memo: inout [[Bool?]]) -> Bool {
////    if totalSum == 0 {
////        return true
////    }
////
////    if n == 0 {
////        return false
////    }
////
////    if memo[n][totalSum] == nil {
////        var hasEqualSumWithN = false
////
////        if arr[n - 1] <= totalSum {
////            hasEqualSumWithN = subsetSum(arr, totalSum - arr[n - 1], n - 1, &memo)
////        }
////
////        let hasEqualSumWithoutN = subsetSum(arr, totalSum, n - 1, &memo)
////
////        memo[n][totalSum] = hasEqualSumWithN || hasEqualSumWithoutN
////    }
////
////    return memo[n][totalSum] ?? false
////}
////
////canPartition([1, 2, 3, 4])
////canPartition([1, 1, 3, 4, 7])
////canPartition([2, 3, 4, 6])
////
////hasSum([1, 2, 3, 7], 6)
////hasSum([1, 2, 7, 1, 5], 10)
////hasSum([1, 3, 4, 8], 6)
////
////
////func minSubSetSumDifference(_ arr: [Int]) -> Int {
////    let totalSum = arr.reduce(0, +)
////    var memo = Array(repeating: Array(repeating: -1, count: totalSum + 1), count: arr.count + 1)
////    return calMinSubsetSumDifference(arr, totalSum, 0, arr.count, &memo)
////}
////
////func calMinSubsetSumDifference(_ arr: [Int], _ totalSum: Int, _ calSum: Int, _ n: Int, _  memo: inout [[Int]]) -> Int {
////
////    if n == 0 {
////        return abs((totalSum - calSum) - calSum)
////    }
////
////    if memo[n][calSum] == -1 {
////        let differenceWithN = (arr[n - 1] + calSum <= totalSum)
////            ? calMinSubsetSumDifference(arr, totalSum, calSum + arr[n - 1], n - 1, &memo)
////            : 0
////
////        let differenceWithoutN = calMinSubsetSumDifference(arr, totalSum, calSum, n - 1, &memo)
////
////        memo[n][calSum] = min(differenceWithN, differenceWithoutN)
////    }
////
////    return memo[n][calSum]
////}
////
////minSubSetSumDifference([1, 2, 3, 9])
////minSubSetSumDifference([1, 2, 7, 1, 5])
////minSubSetSumDifference([1, 3, 100, 4])
////
////func countsubsetSum(_ arr: [Int], _ totalSum: Int, _ n: Int, _ memo: inout [[Int]]) -> Int {
////    if totalSum == 0 {
////        return 1
////    }
////
////    if n == 0 {
////        return 0
////    }
////
////    if memo[n][totalSum] == -1 {
////        var hasEqualSumWithN = 0
////
////        if arr[n - 1] <= totalSum {
////            hasEqualSumWithN = countsubsetSum(arr, totalSum - arr[n - 1], n - 1, &memo)
////        }
////
////        let hasEqualSumWithoutN = countsubsetSum(arr, totalSum, n - 1, &memo)
////
////        memo[n][totalSum] = hasEqualSumWithN + hasEqualSumWithoutN
////    }
////
////    return memo[n][totalSum]
////}
////
////func countSubSets(_ arr: [Int], _ num: Int) -> Int {
////    var memo = Array(repeating: Array(repeating: -1, count:num + 1), count: arr.count + 1)
////    return countsubsetSum(arr, num, arr.count, &memo)
////}
////
////countSubSets([1, 1, 2, 3], 4)
////countSubSets([1, 2, 7, 1, 5], 9)
////
////func findTargetSubsets(_ arr: [Int], _ target: Int) -> Int {
////    let total = arr.reduce(0, +)
////
////    var memo = Array(repeating: Array(repeating: -1, count: 2 * total + 1), count: arr.count + 1)
////
////    return calTargetSubsets(arr, target, 0, total, arr.count,&memo)
////}
////
////func calTargetSubsets(_ arr: [Int],
////                      _ target: Int,
////                      _ calSum: Int,
////                      _ total: Int,
////                      _ n: Int,
////                      _ memo: inout[[Int]]) -> Int {
////
////    if n == 0 {
////        return calSum == target ? 1 : 0
////    }
////
////    if memo[n][total + calSum] == -1 {
////
////        let numberOfSubsetWithN = calTargetSubsets(arr, target, calSum + arr[n - 1], total, n - 1, &memo)
////
////        let numberOfSubsetWithoutN = calTargetSubsets(arr, target, calSum - arr[n - 1], total, n - 1, &memo)
////
////        memo[n][total + calSum] = numberOfSubsetWithN + numberOfSubsetWithoutN
////    }
////
////    return memo[n][total + calSum]
////}
////
////findTargetSubsets([1,1,1,1,1], 3)
//
//func unboundedKnapsack(profits: [Int], weights: [Int], capacity: Int) -> Int {
//    var memo = Array(repeating: Array(repeating: -1, count: capacity + 1), count: profits.count + 1)
//    return calUnboundedKnapsack(profits, weights, profits.count, capacity, &memo)
//}
//
//func calUnboundedKnapsack(_ profits: [Int],
//                          _ weights: [Int],
//                          _ n: Int,
//                          _ capacity: Int,
//                          _ memo: inout [[Int]]) -> Int {
//
//    if n == 0 || capacity == 0 {
//        return 0
//    }
//
//    if memo[n][capacity] == -1 {
//        var profitWithN = 0
//
//        if weights[n - 1] <= capacity {
//            profitWithN = profits[n - 1] + calUnboundedKnapsack(profits, weights, n, capacity - weights[n - 1], &memo)
//        }
//
//        let profitWithoutN = calUnboundedKnapsack(profits, weights, n - 1, capacity, &memo)
//
//        memo[n][capacity] = max(profitWithN, profitWithoutN)
//    }
//
//    return memo[n][capacity]
//}
//
//unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], capacity: 8)// 140
//unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], capacity: 6) // 105
//unboundedKnapsack(profits: [10, 30, 20], weights: [5, 10, 15], capacity: 100) // 300
//unboundedKnapsack(profits: [1, 30], weights: [1, 50], capacity: 100) // 100
//unboundedKnapsack(profits: [10, 40, 50, 70], weights: [1, 3, 4, 5], capacity: 8) // 110
//
//
//func rodCutting(_ prices: [Int], _ lengths: [Int], _ length: Int) -> Int {
//    var memo = Array(repeating: Array(repeating: -1, count: length + 1), count: prices.count + 1)
//    return calUnboundedKnapsack(prices, lengths, prices.count, length, &memo)
//}
//
//rodCutting([2, 6, 7, 10, 13], [1, 2, 3, 4, 5], 5)
//
//func change(_ amount: Int, _ coins: [Int]) -> Int {
//   var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
//   return calculateNumberOfWaysToMakeAmount(coins, amount, coins.count, &memo)
//
//}
//
//func calculateNumberOfWaysToMakeAmount(_ coins: [Int],
//                                       _ amount: Int,
//                                       _ n: Int,
//                                       _ memo: inout [[Int]]) -> Int {
//
//    if amount == 0 {
//        return 1
//    }
//
//    if n == 0 {
//        return 0
//    }
//
//    if memo[n][amount] ==  -1 {
//        var numberOfWaysWithN = 0
//
//        if coins[n - 1] <= amount {
//            numberOfWaysWithN = calculateNumberOfWaysToMakeAmount(coins, amount - coins[n - 1], n, &memo)
//        }
//
//        let numbersOfWaysWithoutN = calculateNumberOfWaysToMakeAmount(coins, amount, n - 1, &memo)
//
//        return numberOfWaysWithN + numbersOfWaysWithoutN
//    }
//
//    return memo[n][amount]
//}
//
////func coinChange(_ coins: [Int], _ amount: Int) -> Int {
////    var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
////    let totalWays = calculateMinCoinsToMakeAmount(coins, amount, coins.count, &memo)
////    return totalWays == Int.max ? -1 : totalWays
////}
////
////func calculateMinCoinsToMakeAmount( _ coins: [Int],
////                                       _ amount: Int,
////                                       _ n: Int,
////                                       _ memo: inout [[Int]]) -> Int {
////
////    if amount == 0 {
////        return 0
////    }
////
////    if n == 0 {
////        return Int.max
////    }
////
////    if memo[n][amount] == -1 {
////        var amountOfCoinsWithN = Int.max
////
////        if coins[n - 1] <= amount {
////            let tempAmount = calculateMinCoinsToMakeAmount(coins, amount - coins[n - 1], n, &memo)
////
////            if tempAmount != Int.max {
////                amountOfCoinsWithN = tempAmount + 1
////            }
////        }
////
////        let amountOfCoinsWitouthN = calculateMinCoinsToMakeAmount(coins,
////                                                               amount,
////                                                               n - 1,
////                                                               &memo)
////
////        memo[n][amount] = min(amountOfCoinsWitouthN, amountOfCoinsWithN)
////
////        return memo[n][amount]
////    }
////
////    return memo[n][amount]
////
////}
//
//func maxRibbonCut(_ ribbonLength: [Int], _ totalLength: Int) -> Int {
//    var memo = Array(repeating: Array(repeating: -1, count: totalLength + 1), count: ribbonLength.count + 1)
//    let totalWays = calculateMaxRibbonCut(ribbonLength, totalLength, ribbonLength.count, &memo)
//    return totalWays == Int.min ? -1 : totalWays
//}
//
//func calculateMaxRibbonCut(_ ribbonLength: [Int],
//                           _ totalLength: Int,
//                           _ n: Int,
//                           _ memo: inout [[Int]]) -> Int {
//
//    if totalLength == 0 {
//        return 0
//    }
//
//    if n == 0 {
//        return Int.min
//    }
//
//    if memo[n][totalLength] == -1 {
//        var totalCutsWithN = Int.min
//
//        if ribbonLength[n - 1] <= totalLength {
//            let tempCuts = calculateMaxRibbonCut(ribbonLength, totalLength - ribbonLength[n - 1], n, &memo)
//
//            if tempCuts != Int.min {
//                totalCutsWithN = tempCuts + 1
//            }
//        }
//
//        let totalCutsWithoutN = calculateMaxRibbonCut(ribbonLength, totalLength, n - 1, &memo)
//
//        memo[n][totalLength] = max(totalCutsWithN, totalCutsWithoutN)
//    }
//
//    return memo[n][totalLength]
//}
//
//
//print(maxRibbonCut([2,3,5], 5)) // 2
//print(maxRibbonCut([2,3], 7)) // 3
//print(maxRibbonCut([3,5,7], 13)) // 3
//print(maxRibbonCut([3,5], 7)) // -1
//print(maxRibbonCut([232, 124, 456], 7))
//
//func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
//    var lo = 1
//    var hi = piles.max() ?? 0
//
//    while lo < hi {
//        let mid = (lo + hi) / 2
//        if  isPossibile(mid,piles, h) {
//            hi = mid
//        } else {
//            lo = mid + 1
//        }
//    }
//
//    return lo
//}
//
//func isPossibile(_ speed: Int, _ piles: [Int], _ k: Int) -> Bool {
//    guard speed > 0 else { return false }
//
//    var count = 0
//
//    for bananas in piles {
//        count = count + bananas / speed
//        if bananas % speed != 0 { count += 1 }
//    }
//
//    return count <= k
//}
//
//func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
//    var memo = Array(repeating: -1, count: target + 1)
//    return calculateAllCombinations(nums, target, &memo)
//}
//
//func calculateAllCombinations(_ nums: [Int], _ target: Int, _ memo: inout [Int]) -> Int {
//
//    if target == 0 {
//        return 1
//    }
//
//    if memo[target]  == -1 {
//        var result = 0
//        for num in nums {
//            if target >= num {
//                result += calculateAllCombinations(nums, target - num, &memo)
//            }
//        }
//
//        memo[target] = result
//    }
//
//    return memo[target]
//}
//
//func integerBreak(_ n: Int) -> Int {
//    var dp = Array(repeating: 0, count: n + 1)
//    dp[1] = 1
//
//    for i in 2...n {
//        for j in 1..<i {
//            let a = (i - j) * j
//            let b = dp[i - j] * j
//            let c = dp[i]
//            dp[i] = max(a, b, c)
//        }
//    }
//
//    return dp[n]
//}
//
//integerBreak(10)
//
//
//func numSquares(_ n: Int) -> Int {
//    var dp = Array(repeating: Int.max, count: n + 1)
//    let maxPossibileSquareIndex = Int(sqrt(Double(n))) + 1
//    let possibileSquares = (0..<maxPossibileSquareIndex).map { $0 * $0 }
//
//    dp[0] = 0
//
//    for num in 1...n {
//        for squareIndex in 1..<maxPossibileSquareIndex {
//            let validSquare = possibileSquares[squareIndex]
//            if num < validSquare {
//                break
//            }
//
//            dp[num] = min(dp[num], dp[num - validSquare] + 1)
//        }
//    }
//
//
//    return dp[n]
//}
//
//
//numSquares(3)
//
//func countWays(_ n: Int) -> Int {
//    var dp = Array(repeating: 0, count: n + 1)
//    if n == 0 { return 0 }
//    if n < 3 { return 1 }
//
//    dp[0] = 1
//    dp[1] = 1
//    dp[2] = 1
//    dp[3] = 2
//
//    for num in 4...n {
//        dp[num] = dp[num - 1] + dp[num - 3] + dp[num - 4]
//    }
//
//    return dp[n]
//}
//
//countWays(4)
//countWays(5)
//countWays(6)
//
//func countMinJump(_ jumps: [Int]) -> Int {
//    var memo = Array(repeating: -1, count: jumps.count)
//    return countMinJumpsRecursive(jumps, 0, &memo)
//}
//
//func countMinJumpsRecursive(_ jumps: [Int], _ currentPos: Int, _ memo: inout [Int]) -> Int {
//
//    if currentPos == jumps.count - 1 {
//        return 0
//    }
//
//    if jumps[currentPos] == 0 {
//        return Int.max
//    }
//
//
//    if memo[currentPos] == -1 {
//
//        var start = currentPos + 1
//        let end = currentPos + jumps[currentPos]
//        var totalMinJumps = Int.max
//
//        while  start < jumps.count && start <= end {
//
//            let partialMinJump = countMinJumpsRecursive(jumps, start, &memo)
//
//            if partialMinJump != Int.max {
//                totalMinJumps = min(partialMinJump + 1, totalMinJumps)
//            }
//
//            start += 1
//        }
//
//        memo[currentPos] = totalMinJumps
//    }
//
//    return memo[currentPos]
//}
//
//countMinJump([2,1,1,1,4])
//countMinJump([1,1,3,6,9,3,0,1,3])
//
//func minJumpFee(_ fee: [Int]) -> Int {
//    var memo = Array(repeating: -1, count: fee.count + 1)
//    return calMinJumps(fee, fee.count, &memo)
//}
//
//func calMinJumps(_ fee: [Int], _ stair: Int, _ memo: inout [Int]) -> Int {
//    if stair < 1 {
//        return 0
//    }
//
//    if stair == 1 || stair == 2 {
//        return fee[0]
//    }
//
//
//    if memo[stair] == -1 {
//        let feeOfOneJump = calMinJumps(fee, stair - 1, &memo) + fee[stair - 1]
//        let feeOfTwoJump = calMinJumps(fee, stair - 2, &memo) + fee[stair - 2]
//        let feeOfThreeJump = calMinJumps(fee, stair - 3, &memo) + fee[stair - 3]
//
//        memo[stair] = min(feeOfOneJump, feeOfTwoJump, feeOfThreeJump)
//
//    }
//
//    return memo[stair]
//}
//
//
//minJumpFee([1,2,5,2,1,2])
//minJumpFee([2,3,4,5])
//
//
//func robUtils(_ nums: [Int]) -> Int {
//        guard nums.count > 1 else { return nums[0] }
//        //var dp = Array(repeating: -1, count: nums.count)
//
//        var n0 = nums[0]
//        var n1 = max(nums[0], nums[1])
//
//        for house in 2..<nums.count {
//            let temp = n1
//            n1 = max(n1, n0 + nums[house] )
//            n0 = temp
//        }
//
//        return n1
//
//}
//
////func rob(_ nums: [Int]) -> Int {
////    if nums.count == 1 { return nums[0] }
////    if nums.count == 2 { return max(nums[0], nums[1]) }
////
////    let houseWithFirst = Array(nums.dropLast())
////    let houseWithoutFirst = Array(nums.dropFirst())
////
////    return max(robUtils(houseWithFirst), robUtils(houseWithoutFirst))
////}
//
//
//func longestPalindromeSubseq(_ s: String) -> Int {
//    let s = Array(s)
//    var memo = Array(repeating: Array(repeating: -1, count: s.count), count: s.count)
//    return findLPSRecursive(s, 0, s.count - 1, &memo)
//}
//
//func findLPSRecursive(_ string: Array<String.Element>, _ startIndex: Int, _ endIndex: Int, _ memo: inout [[Int]]) -> Int {
//
//    if startIndex == endIndex {
//        return 1
//    }
//
//    if startIndex > endIndex {
//        return 0
//    }
//
//    if memo[startIndex][endIndex] == -1 {
//        if string[startIndex] == string[endIndex] {
//            memo[startIndex][endIndex] = 2 + findLPSRecursive(string, startIndex + 1, endIndex - 1, &memo)
//        } else {
//            let length1 = findLPSRecursive(string, startIndex + 1, endIndex, &memo)
//            let length2 = findLPSRecursive(string, startIndex, endIndex - 1, &memo)
//            memo[startIndex][endIndex] = max(length1, length2)
//        }
//    }
//
//    return memo[startIndex][endIndex]
//}
//
//
//longestPalindromeSubseq("bbbab")
//longestPalindromeSubseq("cbbd")
//longestPalindromeSubseq("abdbca")
//longestPalindromeSubseq("cddpd")
//longestPalindromeSubseq("pqr")
//
//
//var count = 0
//
//func findLongestPalindromicSubstringRecursive(_ string: Array<String.Element>, _ startIndex: Int, _ endIndex: Int, _ memo: inout [[Int]]) -> Int {
//
//    if startIndex == endIndex {
//        count += 1
//        return 1
//    }
//
//    if startIndex > endIndex {
//        return 0
//    }
//
//    if memo[startIndex][endIndex] == -1 {
//
//        if string[startIndex] == string[endIndex] {
//            let substringLength = endIndex - startIndex - 1
//
//            let palindromicLength = findLongestPalindromicSubstringRecursive(string, startIndex + 1, endIndex - 1, &memo)
//
//            if substringLength == palindromicLength {
//                memo[startIndex][endIndex] = 2 + substringLength
//                count += 1
//                return memo[startIndex][endIndex]
//            }
//        }
//
//        let length1 = findLongestPalindromicSubstringRecursive(string, startIndex + 1, endIndex, &memo)
//        let length2 = findLongestPalindromicSubstringRecursive(string, startIndex, endIndex - 1, &memo)
//
//        if length1 > 0 { count += 1 }
//        if length2 > 0 { count += 1 }
//
//        memo[startIndex][endIndex] = max(length1, length2)
//    }
//
//    return memo[startIndex][endIndex]
//}
//
////func longestPalindrome(_ s: String) -> Int {
////    let s = Array(s)
////    var memo = Array(repeating: Array(repeating: -1, count: s.count), count: s.count)
////    return findLongestPalindromicSubstringRecursive(s, 0, s.count - 1, &memo)
////}
//
//
//func minInsertions(_ s: String) -> Int {
//    let s = Array(s)
//    var memo = Array(repeating: Array(repeating: -1, count: s.count), count: s.count)
//    let longestPalindrome = findLPSRecursive(s, 0, s.count - 1, &memo)
//    return s.count - longestPalindrome
//}
//
//
//minInsertions("no")
//
//func findMPPCuts(_ s: String) -> Int {
//    let s = s.map{ String($0) }
//    var isPalindromeMemo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: s.count), count: s.count)
//    var memo = Array(repeating: Array(repeating: -1, count: s.count), count: s.count)
//    return findMPPCutsRecursive(s, 0, s.count - 1, &memo, &isPalindromeMemo)
//}
//
//func findMPPCutsRecursive(_ strArr: [String],
//                          _ start: Int,
//                          _ end: Int,
//                          _ memo: inout [[Int]],
//                          _ isPalindromeMemo: inout [[Bool?]]) -> Int {
//
//    if end >= strArr.count || isPalindrome(strArr, start, end, &isPalindromeMemo) {
//        return 0
//    }
//
//    if memo[start][end] == -1 {
//        var minCuts = end - start
//        for i in start...end {
//            if isPalindrome(strArr, start, i, &isPalindromeMemo) {
//                minCuts = min(minCuts, 1 + findMPPCutsRecursive(strArr,
//                                                              i + 1,
//                                                              end,
//                                                              &memo,
//                                                              &isPalindromeMemo))
//
//            }
//        }
//
//        memo[start][end] = minCuts
//    }
//
//    return memo[start][end]
//}
//
//
//func isPalindrome(_ strArr: [String], _ start: Int, _ end: Int, _ isPalindromeMemo: inout [[Bool?]]) -> Bool {
//
//    if isPalindromeMemo[start][end] == nil {
//
//        isPalindromeMemo[start][end] = true
//
//        var currStart = start
//        var currEnd = end
//
//        while currStart < currEnd {
//            if strArr[currStart] != strArr[currEnd] {
//                isPalindromeMemo[start][end] = false
//                break
//            }
//
//            currStart += 1
//            currEnd -= 1
//
//            if currStart < currEnd && isPalindromeMemo[currStart][currEnd] != nil {
//                isPalindromeMemo[start][end] = isPalindromeMemo[currStart][currEnd]
//                break
//            }
//        }
//    }
//
//    return isPalindromeMemo[start][end] ?? false
//}
//
//findMPPCuts("abdbca")
//findMPPCuts("cdpdd")
//findMPPCuts("pqr")
//findMPPCuts("pp")
//
//func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
//    let text1 = Array(text1)
//    let text2 = Array(text2)
//    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
//
//
//    for l1 in 1...text1.count {
//        for l2 in 1...text2.count {
//            if text1[l1 - 1] == text2[l2 - 1] {
//                dp[l1][l2] = dp[l1 - 1][l2 - 1] + 1
//            } else {
//                dp[l1][l2] = max(dp[l1 - 1][l2], dp[l1][l2 - 1])
//            }
//        }
//    }
//    return dp[text1.count][text2.count]
//}
//
//func findMDI(_ str1: String, _ str2: String) -> (deletes: Int, inserts: Int) {
//    let maxSubseqLength = longestCommonSubsequence(str1, str2)
//    return (str1.count - maxSubseqLength, str2.count - maxSubseqLength)
//}
//
//
//findMDI("abc", "fbc")
//findMDI("abdca", "cbda")
//findMDI("passport", "ppsspt")
//
//
////func lis(_ nums: [Int]) -> Int {
////    var dp = Array(repeating: 1, count: nums.count)
////    var count = Array(repeating: 1, count: nums.count)
////    var maxSubseq = 0
////
////    for i in 1..<nums.count {
////        for j in 0..<i {
////            if nums[i] > nums[j] && dp[i] <= dp[j]{
////                dp[i] = dp[j] + 1
////                maxSubseq = max(maxSubseq, dp[i])
////                count[i] = count[j]
////            } else if dp[i] == dp[j] + 1 {
////                count[i] += count[j]
////            }
////        }
////    }
////
////    var counter = 0
////
////    for i in 0..<dp.count {
////        if dp[i] == maxSubseq {
////            counter += count[i]
////        }
////    }
////
////    return counter
////}
////
////lis([1,3,5,4,7])
//
//
//
////func printLongestCommonSubseq(_ str1: String, _ str2: String) -> String {
////    let str1 = Array(str1)
////    let str2 = Array(str2)
////
////    var dp = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)
////
////    for i in 1...str1.count {
////        for j in 1...str2.count {
////            if str1[i - 1] == str2[j - 1] {
////                dp[i][j] = 1 + dp[i - 1][j - 1]
////            } else {
////                dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
////            }
////        }
////    }
////
////    var res = ""
////    var l1 = str1.count
////    var l2 = str2.count
////
////    while l1 > 0 && l2 > 0 {
////        if str1[l1 - 1] == str2[l2 - 1] {
////            res = String(str1[l1 - 1]) + res
////            l1 -= 1
////            l2 -= 1
////        } else if dp[l1][l2 - 1] > dp[l1 - 1][l2] {
////            l2 -= 1
////        } else {
////            l1 -= 1
////        }
////    }
////
////    return res
////}
////
////
////printLongestCommonSubseq("ABCDGH", "AEDFHR")
////printLongestCommonSubseq("AGGTAB", "GTAB")
//
//
//func coinChange(_ coins: [Int], _ amount: Int) -> Int {
//    var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
//    let totalWays = calculateMinCoinsToMakeAmount(coins, amount, coins.count, &memo)
//    return totalWays == Int.max ? -1 : totalWays
//}
//
//func calculateMinCoinsToMakeAmount( _ coins: [Int],
//                                       _ amount: Int,
//                                       _ n: Int,
//                                       _ memo: inout [[Int]]) -> Int {
//
//    if amount == 0 {
//        return 0
//    }
//
//    if n == 0 {
//        return Int.max
//    }
//
//    if memo[n][amount] == -1 {
//        var amountOfCoinsWithN = Int.max
//
//        if coins[n - 1] <= amount {
//            let tempAmount = calculateMinCoinsToMakeAmount(coins, amount - coins[n - 1], n, &memo)
//
//            if tempAmount != Int.max {
//                amountOfCoinsWithN = tempAmount + 1
//            }
//        }
//
//        let amountOfCoinsWitouthN = calculateMinCoinsToMakeAmount(coins,
//                                                               amount,
//                                                               n - 1,
//                                                               &memo)
//
//        memo[n][amount] = min(amountOfCoinsWitouthN, amountOfCoinsWithN)
//
//        return memo[n][amount]
//    }
//
//    return memo[n][amount]
//
//}
//
//
////func coinChange(_ coins: [Int], _ amount: Int) -> Int {
////    var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
////    let totalWays = calculateMinCoinsToMakeAmount(coins, amount, coins.count, &memo)
////    return totalWays == Int.max ? -1 : totalWays
////}
////
////func calculateMinCoinsToMakeAmount( _ coins: [Int],
////                                       _ amount: Int,
////                                       _ n: Int,
////                                       _ memo: inout [[Int]]) -> Int {
////
////    if amount == 0 {
////        return 0
////    }
////
////    if n == 0 {
////        return Int.max
////    }
////
////    if memo[n][amount] == -1 {
////        var amountOfCoinsWithN = Int.max
////
////        if coins[n - 1] <= amount {
////            let tempAmount = calculateMinCoinsToMakeAmount(coins, amount - coins[n - 1], n, &memo)
////
////            if tempAmount != Int.max {
////                amountOfCoinsWithN = tempAmount + 1
////            }
////        }
////
////        let amountOfCoinsWitouthN = calculateMinCoinsToMakeAmount(coins,
////                                                               amount,
////                                                               n - 1,
////                                                               &memo)
////
////        memo[n][amount] = min(amountOfCoinsWitouthN, amountOfCoinsWithN)
////
////        return memo[n][amount]
////    }
////
////    return memo[n][amount]
////
////}
//
//func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
//    var memo = Array(repeating: -1, count: 366)
//    return mincostTickets(Set(days), costs, 1, &memo)
//}
//
//func mincostTickets(_ days: Set<Int>, _ costs: [Int], _ day: Int, _ memo: inout [Int]) -> Int {
//
//    if days.max()! < day {
//        return 0
//    }
//
//    if memo[day] != -1 {
//        return memo[day]
//    }
//
//    if days.contains(day) {
//        let oneDayCost = mincostTickets(days, costs, day + 1, &memo) + costs[0]
//        let sevenDayCost = mincostTickets(days, costs, day + 7, &memo) + costs[1]
//        let thirtyDayCost = mincostTickets(days, costs, day + 30, &memo) + costs[2]
//
//        memo[day] = min(oneDayCost, sevenDayCost, thirtyDayCost)
//    } else {
//        memo[day] = mincostTickets(days, costs, day + 1, &memo)
//    }
//
//    return memo[day]
//}
//
//
//
//mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15])
//
//
//func countSubstrings(_ s: String) -> Int {
//    var dp : [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
//    var count = 0
//
//    for i in 0..<s.count {
//        dp[i][i] = true
//        count += 1
//    }
//    let sArr = Array(s)
//
//    for start in stride(from: s.count - 1, to: -1, by: -1) {
//        for end in start + 1..<s.count {
//            if sArr[start] == sArr[end] {
//                if end - start == 1 || dp[start + 1][end - 1] {
//                    dp[start][end] = true
//                    count += 1
//                }
//            }
//        }
//    }
//    return count
//}
//
//func longestPalindrome(_ s: String) -> String {
//    var dp : [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
//    let sArr = s.map{ String($0)}
//    var row = 0
//    var col = 0
//    var maxLength = 1
//
//    for i in 0..<s.count {
//        dp[i][i] = true
//    }
//
//    for start in stride(from: s.count - 1, to: -1, by: -1) {
//        for end in start + 1..<s.count {
//            if sArr[start] == sArr[end] {
//                if end - start == 1 || dp[start + 1][end - 1] {
//                    let count = end - start + 1
//                    dp[start][end] = true
//                    if maxLength < count {
//                        row = start
//                        col = end
//                        maxLength = count
//                    }
//                }
//            }
//        }
//    }
//
//    return sArr[row...col].reduce("", +)
//}
//
//
//longestPalindrome("babad")
//longestPalindrome("cbbd")

// Time : N *


public class Node {
     public var val: Int
     public var left: Node?
     public var right: Node?
    public var parent: Node?
    
    public init(_ val: Int) {
         self.val = val
         self.left = nil
       self.right = nil
        self.parent = nil
     }
 }


/*
    if has right tree
        - if it's leaf || dont have left return it
        - else if recur with left
    else check first ancestor
        - if ancestor is bigger than target return it
        - else traverse up, check the above condition with next ancestor to previous
 
 */

//
//class Trie {
//    let root = TrieNode()
//
//    func addWord(_ word: String) {
//        var current = root
//
//        for char in word {
//            if let next = current.find(char) {
//                current = next
//            } else {
//                let next = current.addChild(char)
//                current = next
//            }
//        }
//
//        current.isWord = true
//    }
//
//    func addWords(_ words: [String]) {
//        for word in words {
//            addWord(word)
//        }
//    }
//
//    func hasPrefix(_ prefix: String) -> Bool {
//        var current = root
//        for char in prefix {
//            if let next = current.find(char) {
//                current = next
//            } else { return false }
//        }
//        return true
//    }
//
//    func hasWord(_ word: String) -> Bool {
//        guard !word.isEmpty else { return false }
//        var current = root
//        for char in word {
//            if let next = current.find(char) {
//                current = next
//            } else { return false }
//        }
//
//        return current.isWord
//    }
//
//    func isConcatenated(_ word: String) -> Bool {
//        var current = root
//        var findWord = false
//
//        for char in word {
//            if findWord { return true }
//            if let next = current.find(char) {
//                findWord = next.isWord
//                current = next
//            }
//        }
//
//        return false
//    }
//}
//
//class TrieNode {
//    var isWord = false
//    var key: Character?
//    var children = [Character: TrieNode]()
//
//    func addChild(_ child: Character) -> TrieNode {
//        if let childNode = children[child] { return childNode }
//        let node = TrieNode()
//        node.key = child
//        children[child] = node
//        return node
//    }
//
//    func find(_ child: Character) -> TrieNode? { children[child] }
//}

func rotate(_ matrix: inout [[Int]]) {
    transpose(&matrix)
    reverseMatrix(&matrix)
}

func transpose(_ matrix: inout [[Int]]) {
    for row in 0..<matrix.count {
        for col in row..<matrix.count {
            let temp = matrix[row][col]
            matrix[row][col] = matrix[col][row]
            matrix[col][row] = temp
        }
    }
}

func reverseMatrix(_ matrix: inout [[Int]]) {
    for row in 0..<matrix.count {
        for col in 0..<matrix.count / 2 {
            let temp = matrix[row][col]
            matrix[row][col] = matrix[row][matrix.count - 1 - col]
            matrix[row][matrix.count - 1 - col] = temp
        }
    }
}


func bracketMatch(text: String) -> Int {
    var stack = [Character]()
    var count = 0
    for bracket in text {
        if "(" == bracket {
            stack.append(bracket)
        } else {
            guard let openBracket = stack.popLast()
            else {
                count += 1
                continue
            }
        }
    }
    
    return count + stack.count
}


bracketMatch(text: ")((")


func setZeroes(_ matrix: inout [[Int]]) {
    var firstRowHasZeroes = false
    var firstColHasZeroes = false
    
    // check for the first row
    for col in 0..<matrix[0].count {
        if matrix[0][col] == 0 {
            firstRowHasZeroes = true
            break
        }
    }
    
    // check for the first col
    for row in 0..<matrix.count {
        if matrix[row][0] == 0 {
            firstColHasZeroes = true
            break
        }
    }
    
    // checking rest of the matrix
    for row in 1..<matrix.count {
        for col in 1..<matrix[0].count {
            if matrix[row][col] == 0 {
                matrix[0][col] = 0
                matrix[row][0] = 0
            }
        }
    }
    
    if firstRowHasZeroes {
        for col in 0..<matrix[0].count {
             matrix[0][col] = 0
        }
    }
    
    if firstColHasZeroes {
        for row in 0..<matrix.count {
             matrix[row][0] == 0
            
        }
    }
    
    for row in 1..<matrix.count {
        for col in 1..<matrix[0].count {
            if matrix[0][col] == 0 || matrix[row][0] == 0{
                matrix[row][col] = 0
            }
        }
    }
    
}


//func singleNumber(_ nums: [Int]) -> Int {
//        var result = 0
//
//        for i in 0..<nums.count {
//            result ^= nums[i]
//        }
//
//        return result
//
//}


