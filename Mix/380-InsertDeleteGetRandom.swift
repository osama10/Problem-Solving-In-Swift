// 380 
class RandomizedSet {
    var dict = [Int: Int]()
    var arr = [Int]()
 
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if dict[val] != nil { return false }
        dict[val] = arr.count
        arr.append(val)
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if dict[val] == nil { return false }
        let indexOfDeletion = dict[val]!
       if indexOfDeletion < arr.count - 1 {
           arr.swapAt(indexOfDeletion, arr.count - 1)
           dict[arr[indexOfDeletion]] = indexOfDeletion
           
       }
        dict[val] = nil
        arr.removeLast()
        
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        let index = Int.random(in: 0..<arr.count) 
        return arr[index]
    }
}