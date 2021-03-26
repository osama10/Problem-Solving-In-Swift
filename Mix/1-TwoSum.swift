 // 1
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