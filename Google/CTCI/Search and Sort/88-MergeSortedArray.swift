class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = m - 1
        var index2 = n - 1
        var mergedIndex = m + n - 1
        
        while index2 >= 0 {
            if index1 >= 0 && nums1[index1] >= nums2[index2] {
                nums1[mergedIndex] = nums1[index1]
                index1 -= 1
            } else {
                nums1[mergedIndex] = nums2[index2]
                index2 -= 1
            }
            
            mergedIndex -= 1
        } 
    }
}