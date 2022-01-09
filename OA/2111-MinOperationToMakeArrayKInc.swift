class Solution {
    // Time: O(nlogn)
    // Space: O(1)
    func lengthOfLNDS(_ nums: [Int]) -> Int {
        var sub: [Int] = [nums[0]]
        for i in 1..<nums.count {
            let num = nums[i]
            if num >= sub.last! {
                sub.append(num)
            } else {
                sub[getGreatestSmallerOrEqual(num, sub)] = num
            }
        }
        
        return sub.count
    }
    
    // Time: O(logn)
    // Space: O(1)
    func getGreatestSmallerOrEqual(_ target: Int, _ arr: [Int]) -> Int {
        var lo = 0
        var hi = arr.count - 1
        while lo < hi {
            let mi = lo + (hi - lo) / 2
            if arr[mi] <= target {
                lo = mi + 1
            } else {
                hi = mi
            }
        }
        return lo
    }
    
    // Time: O(k * nlogn)
    // Space: O(n)
    func kIncreasing(_ arr: [Int], _ k: Int) -> Int {
        let n = arr.count
        var ans = 0
        for i in 0..<k {
            var j = i
            var newArr: [Int] = []
            while j < n {
                newArr.append(arr[j])
                j += k
            }
            ans += (newArr.count - lengthOfLNDS(newArr))
        }
        return ans
    }
}

// https://leetcode.com/problems/minimum-operations-to-make-the-array-k-increasing/discuss/1635220/Swift-LIS-(but-actually-Longest-Non-Decreasing-Sequence)