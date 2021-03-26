
/// 1099 . Two Sum Less Than K (https://leetcode.com/problems/two-sum-less-than-k/): Given an array A of integers and integer K, return the maximum S such that there exists i < j with A[i] + A[j] = S and S < K. If no i, j exist satisfying this equation, return -1.

func twoSumLessThanK(_ arr: [Int], _ k: Int) -> Int {
    var lo = 0
    var hi = arr.count - 1
    var result = Int.min

    while lo < hi {
        let sum = arr[lo] + arr[hi]
        if sum < k {
            result = max(sum, result)
            lo += 1
        }
        else { hi -= 1 }
    }

    return result
}
