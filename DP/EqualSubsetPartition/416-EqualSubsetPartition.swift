// 416 https://www.geeksforgeeks.org/partition-problem-dp-18/
  func canPartition(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)
    if sum%2 != 0 { return false }
    var cache : [[Bool?]] = Array(repeating: Array(repeating: nil, count: nums.count + 1), count: sum/2 + 1)
    return equalPartitionExist(nums, sum/2, nums.count, &cache)
}

func equalPartitionExist(_ arr: [Int], _ sum: Int, _ index: Int, _ cache: inout [[Bool?]]) -> Bool {
    if sum == 0 { return true }
    if let canPartition = cache[sum][index] { return canPartition }
    if arr.count == 0 || index <= 0 { return false }
    if arr[index - 1] <= sum {
        if equalPartitionExist(arr, sum - arr[index - 1], index - 1, &cache) {
            cache[sum][index] = true
            return true
        }
    }
    cache[sum][index] = equalPartitionExist(arr,  sum, index - 1, &cache)
    return cache[sum][index] ?? false
}

canPartition([1,5,11,5])
canPartition([1,2,3,5])