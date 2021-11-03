func singleNumber(_ nums: [Int]) -> Int {
//        var result = 0
//        
//        for i in 0..<nums.count {
//            result ^= nums[i]
//        }
//        
//        return result
//    
//}

   func singleNumber(_ nums: [Int]) -> Int {
      nums.reduce(0, ^)
    }