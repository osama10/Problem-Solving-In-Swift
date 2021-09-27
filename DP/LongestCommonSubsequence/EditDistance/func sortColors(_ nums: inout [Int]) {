 func sortColors(_ nums: inout [Int]) {
        var zeroIndex = 0 
        var currentIndex = 0
        var twoIndex = nums.count - 1
        
        while currentIndex <= twoIndex {
            if nums[currentIndex] == 0 {
                nums.swapAt(currentIndex,zeroIndex)
                currentIndex += 1
                zeroIndex += 1
            } else if nums[currentIndex] == 2 {
                nums.swapAt(currentIndex,twoIndex)
                twoIndex -= 1
            } else {
                currentIndex += 1

            }
        }
}