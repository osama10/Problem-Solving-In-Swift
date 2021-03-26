/// 15

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 { return [] }
    var result = [[Int]]()
    let nums = nums.sorted()
    
    func twoSum(_ low: Int, _ high: Int, _ k : Int ) {
        var low = low
        var high = high

        while low <  high{
            let sum = nums[low] + nums[high]
            if sum == k {
                result.append([-k, nums[low] , nums[high]])
                low += 1
                high -= 1
                while low < high && nums[low] == nums[low - 1] { low += 1 }
                while low < high && nums[high] == nums[high + 1] { high -= 1 }
            }
            else if sum > k { high -= 1 }
            else { low += 1 }

        }
    }

    for i  in 0..<nums.count-2 {
        if i > 0 && nums[i - 1] == nums[i] { continue }
        twoSum(i + 1, nums.count - 1, -nums[i])
    }

    return result
}