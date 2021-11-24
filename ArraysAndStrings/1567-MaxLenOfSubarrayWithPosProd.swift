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
