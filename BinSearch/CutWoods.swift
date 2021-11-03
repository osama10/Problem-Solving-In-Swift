// https://leetcode.com/discuss/interview-question/354854/

func cutWoods(_ woodLengths: [Int], _ k: Int) -> Int {
    var left = 1
    var right = woodLengths.max() ?? 0
    var res = 0
    while left < right {
        let length = (left + right) / 2
        
        if isValid(woodLengths, length, k) {
            left = length + 1
            res = length
        } else {
            right = length
        }
    }
    
    return res
}

func isValid(_ woodLengths: [Int], _ length: Int, _ k: Int) -> Bool {
    var count = 0
    
    for woodLength in woodLengths {
        if woodLength >= length {
            count += woodLength / length
        } else {
            return false
        }
    }
    
    return count >= k
}

cutWoods([5, 9, 7], 3)
cutWoods([5, 9, 7], 4)
cutWoods([1, 2, 3], 7)
cutWoods([232, 124, 456], 7)
