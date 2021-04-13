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



func findPath(_ matrix: [[Int?]] ) -> [(x: Int, y: Int)] {
    var visited : [[Bool]] = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
    var path = [(x: Int, y: Int)]()
    if findPath(matrix, &visited, matrix.count - 1, matrix[0].count -  1, &path) {
        return path
    }
    return []
}


func findPath(_ matrix: [[Int?]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ path: inout [(x: Int, y: Int)]) -> Bool {
    
    if row < 0 || col < 0 || row >= matrix.count || col >= matrix[0].count || matrix[row][col] == nil { return false }
    
    if visited[row][col] { return false }
   
    if row == 0 && col == 0  {
        path.append((0,0))
        return true
    }
    
    if findPath(matrix, &visited, row - 1, col, &path) || findPath(matrix, &visited, row, col - 1, &path) {
        path.append((row,col))
        return true
    }
    
    visited[row][col] = true
    return false
}

var matrix1 = [[1, 1, 1], [1, 1, 1], [1, 1, 1] ]
var matrix2 = [[1, 1, 1], [1, 1, nil], [1, 1, 1] ]
var matrix3 = [[1, nil, 1], [1, 1, nil], [1, 1, 1] ]
var matrix4 = [[nil, nil, 1], [1, 1, nil], [1, 1, 1] ]

findPath(matrix1)
findPath(matrix2)
findPath(matrix3)
findPath(matrix4)

