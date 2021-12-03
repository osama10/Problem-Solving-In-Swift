 protocol NestedInteger {
     // Return true if this NestedInteger holds a single integer, rather than a nested list.
     func isInteger() -> Bool

     // Return the single integer that this NestedInteger holds, if it holds a single integer
     // The result is undefined if this NestedInteger holds a nested list
     func getInteger() -> Int

     // Set this NestedInteger to hold a single integer.
     func setInteger(value: Int)

     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
     func add(elem: NestedInteger)

     // Return the nested list that this NestedInteger holds, if it holds a nested list
     // The result is undefined if this NestedInteger holds a single integer
     func getList() -> [NestedInteger]
 }

class NestedIterator {
    private var flattendArr: [Int]
    private var nextPtr: Int
    
    init(_ nestedList: [NestedInteger]) {
        flattendArr = flatenList(nestedList)
        nextPtr = flattendArr.count
    }
    
    func next() -> Int {
        let index = nextPtr
        nextPtr += 1
        return flattendArr[index]
    }
    
    func hasNext() -> Bool {
        !flattendArr.isEmpty && nextPtr < flattendArr.count
    }
    
}

func flatenList(_ nestedList: [NestedInteger]) -> [Int] {
    guard !nestedList.isEmpty else { return [] }
    var result = [Int]()
    
    for list in nestedList {
        if list.isInteger() {
            result.append(list.getInteger())
        } else  {
            let tempArr = flatenList(list.getList())
            result.append(contentsOf: tempArr)
        }
    }
    
    return result
}
