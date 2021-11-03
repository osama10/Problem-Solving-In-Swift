class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var leftHeight = Array(repeating: 0, count: height.count)
        var rightHeight = Array(repeating: 0, count: height.count)
        var ans = 0
        
        leftHeight[0] = height[0]
        rightHeight[height.count - 1] = height[height.count - 1]
        
        for i in 1..<height.count {
            leftHeight[i] = max(leftHeight[i - 1], height[i])
        }
        
        for i in stride(from: height.count - 2, to: -1, by: -1  ) {
            rightHeight[i] = max(rightHeight[i + 1], height[i])
        }
        
        for i in 1..<height.count-1 {
            ans += min(leftHeight[i], rightHeight[i]) - height[i]
        }
        
        return ans
    }
}


class Solution2 {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var ans = 0
        var left = 0
        var right = height.count - 1
        var maxLeft = 0
        var maxRight = 0
        
        while left < right {
            if height[left] < height[right] {
                if height[left] >= maxLeft {
                    maxLeft = height[left]
                } else {
                    ans += maxLeft - height[left]
                    
                }
                left += 1
            } else {

             if height[right] >= maxRight {
                    maxRight = height[right]
                } else {
                    ans += maxRight - height[right]
                    
                }
                right -= 1
            }
        }
        
        
        return ans
    }
}