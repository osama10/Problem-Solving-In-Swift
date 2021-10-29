class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var start = 0
        var dict = [Int: Int]()
        var length = 0
        
        for (end, fruit) in fruits.enumerated() {
            dict[fruit] = end
            
            if dict.keys.count == 3 {
                let minKey = Array(dict.values).min()!
                let index = dict[fruits[minKey]]!
                dict[fruits[minKey]] = nil
                start = index + 1
            }
            
            length = max(end - start + 1, length)
        }
        
        return length 
    }
}