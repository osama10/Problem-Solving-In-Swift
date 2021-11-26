
class FirstUnique {
    var freqTable = [Int: Int]()
    var queue = [Int]()
    
    init(_ nums: [Int]) {
        nums.forEach { value in
            if let count = freqTable[value] {
                freqTable[value] = count + 1
            } else {
                freqTable[value] = 1
                queue.append(value)
            }  
        }
        
    }
    
    func showFirstUnique() -> Int {
        for num in queue {
            if let freq = freqTable[num], freq == 1 {
                return num
            }
        }
        
        return -1
    }
    
    func add(_ value: Int) {
        if let count = freqTable[value] {
            freqTable[value] = count + 1
        } else {
            freqTable[value] = 1
            queue.append(value)
        }  
    }
}

/**
 * Your FirstUnique object will be instantiated and called as such:
 * let obj = FirstUnique(nums)
 * let ret_1: Int = obj.showFirstUnique()
 * obj.add(value)
 */