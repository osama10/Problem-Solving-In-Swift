    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        var map = [Int: Int]()
        
        for num in nums2 {
            while !stack.isEmpty, num > stack.last! {
                map[stack.removeLast()] = num
            }
            
            stack.append(num)
        }
        
        for num in stack {
            map[num] = -1
        }

        var result = [Int]()
        
        for num in nums1 {
            if let maxNum = map[num] {
                 result.append(maxNum)
            }
        }
        
        return result
    }