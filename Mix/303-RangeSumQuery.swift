class NumArray {
    var prefixSum = [Int]()
    init(_ nums: [Int]) {
        
        prefixSum.append(nums[0])
    
        for i in 1..<nums.count {
            prefixSum.append( prefixSum[i - 1] + nums[i] )
        }
       
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return left > 0 ? prefixSum[right] - prefixSum[left - 1] : prefixSum[right]
    }
}