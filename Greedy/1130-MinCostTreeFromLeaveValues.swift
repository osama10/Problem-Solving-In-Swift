class Solution {
func mctFromLeafValues(_ arr: [Int]) -> Int {
    
    var arr = [Int.max] + arr + [Int.max]
    var ans = 0
    
    while arr.count > 3 {
        let minVal = arr.min()!
        let index: Int = arr.firstIndex(of: minVal)!
        let product1 = arr[index - 1] == Int.max ? Int.max : arr[index - 1] * minVal
        let product2 = arr[index + 1] == Int.max ? Int.max : arr[index + 1] * minVal
        ans += min(product1, product2)
        arr.remove(at: index)
    }
    
    return ans
}

}