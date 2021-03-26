// 179
func largestNumber(_ nums: [Int]) -> String {
    let numbers = nums.map(String.init).sorted{ $0 + $1 > $1 + $0 }
    let result = numbers.joined()
    return Int(result) == 0 ? "0" : result
}
