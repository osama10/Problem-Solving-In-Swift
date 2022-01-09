func maxSubArrayWithProduct1(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    let zeroCount = nums.filter { $0 == -1 }.count
    
    if zeroCount % 2 == 0 {
        return nums.count
    }
    
    var rightIndex = 0
    var leftIndex = 0
    
    for i in 0..<nums.count {
        if nums[i] == -1 {
            leftIndex = i + 1
            break
        }
    }
    
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        if nums[i] == -1 {
            rightIndex = i
            break
        }
    }
        
    return max(nums.count - leftIndex, rightIndex)
}

func getMaxLen(_ nums: [Int]) -> Int {
    var startOfArray = -1
    var startOfNegative = -1
    var numOfNegatives = 0
    
    var length = 0
    
    for (i, num) in nums.enumerated() {
        if num == 0 {
            startOfArray = i
            startOfNegative = -1
            numOfNegatives = 0
        } else if num < 0 {
            if startOfNegative == -1 {
                startOfNegative = i
            }
            
            numOfNegatives += 1
        }
        
        let end = numOfNegatives % 2 == 0 ? startOfArray : startOfNegative
        length = max(length, i -  end)
    }
    
    return length
}

getMaxLen([ -1,-1,-1,-1,-1, 1])
maxSubArrayWithProduct1([ -1,-1,-1,-1,-1, 1])
