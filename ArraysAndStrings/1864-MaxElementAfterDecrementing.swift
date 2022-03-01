class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        let arr = arr.sorted()
        var result = [Int]()
        
        for i in 0..<arr.count {
            if i == 0 {
                result.append(1)
            } else {
                let diff = abs(result[i - 1] - arr[i])
                let val = diff > 1 ? result[i - 1] + 1 : arr[i]
                result.append(val)
            }
        }
        
        return result.max() ?? 1
    }
}