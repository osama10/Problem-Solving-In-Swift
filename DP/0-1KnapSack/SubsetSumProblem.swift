/// https://www.geeksforgeeks.org/subset-sum-problem-dp-25/

func checkSubSum(_ arr: [Int], _ sum: Int) -> Bool {
    var cache : [[Bool?]] = Array(repeating: Array(repeating: nil, count: sum + 1), count: arr.count + 1)
    return hasSubSetSum(arr, sum, arr.count, &cache)
}

func hasSubSetSum( _ arr: [Int], _ sum: Int, _ index: Int, _ cache: inout [[Bool?]]) -> Bool {
    if sum == 0 { return true }
    if index <= 0 { return false }
    if let alreadyCal = cache[index][sum] { return alreadyCal }
    if arr[index - 1] <= sum {
        if hasSubSetSum(arr, sum - arr[index - 1], index - 1, &cache) {
            cache[index][sum] = true
            return true
        }
    }
     cache[index][sum] = hasSubSetSum(arr, sum, index - 1, &cache)

    return cache[index][sum]!
}