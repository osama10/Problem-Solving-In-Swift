// https://www.geeksforgeeks.org/count-of-subsets-with-sum-equal-to-x/
// https://www.youtube.com/watch?v=MqYLmIzl8sQ

func countSubset(_ arr: [Int],
                 _ targetSum: Int,
                 _ n: Int,
                 _ memo: inout [[Int]]) -> Int {
    
    if targetSum == 0 { return 1 }
    if n == 0 { return 0 }
    if memo[n][targetSum] != -1 { return memo[n][targetSum] }
    
    if arr[n - 1] > targetSum {
        memo[n][targetSum] = countSubset(arr, targetSum, n - 1 , &memo)
        return memo[n][targetSum]
    }
    
    memo[n][targetSum] = countSubset(arr, targetSum, n - 1 , &memo) +
        countSubset(arr, targetSum - arr[n - 1], n - 1 , &memo)
  
    return memo[n][targetSum]
    
}

func countSubsetSum(_ arr: [Int], _ targetSum: Int) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: targetSum + 1),
                     count: arr.count + 1)
    return countSubset(arr, targetSum, arr.count, &memo)
}

countSubsetSum([1, 1, 1, 1], 1)