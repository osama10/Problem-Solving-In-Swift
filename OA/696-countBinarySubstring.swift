class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var result = 0
        let sArr = s.map {Character(String($0))}
        var groups:[Int] = []
        var i = 0
        while i < sArr.count {
            var j = i+1
            let val = sArr[i]
            while j < sArr.count && sArr[j] == val {
                j += 1
            }
            groups.append(j-i)
            i = j
        }

        for i in 0..<groups.count-1 {
            result += min(groups[i], groups[i+1])
        }

        return result
    }
}