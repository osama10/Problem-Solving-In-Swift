//: [Previous](@previous)

import Foundation

/// 380

class RandomizedSet {
    var dict = [Int: Int]()
    var arr = [Int]()

    /** Initialize your data structure here. */
    init() { }

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

/// 381 Duplicate Allowed

class RandomizedCollection {
    var array = [Int]()
    var map = [Int: Set<Int>]()
    /** Initialize your data structure here. */
    init() {

    }

    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        let result = map[val, default: Set<Int>()].count == 0 ? true: false
        map[val, default: Set<Int>()].insert(array.count)
        array.append(val)
        return result
    }

    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if map[val, default: Set<Int>()].count == 0 { return false }
        let indexToRemove = map[val]!.first!
        map[val]!.remove(indexToRemove)
        if indexToRemove < array.count - 1 {
            array.swapAt(indexToRemove, array.count - 1)
            map[array[indexToRemove]]!.remove(array.count - 1)
            map[array[indexToRemove]]!.insert(indexToRemove)
        }

        array.removeLast()
        return true
    }

    /** Get a random element from the collection. */
    func getRandom() -> Int {
        let index = Int.random(in: 0..<array.count)
        return array[index]
    }
}
