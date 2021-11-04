// https://leetcode.com/discuss/interview-question/1374405/Snapchat-Phone-Screen
class Value {
    let value: Int
    var count: Int
    
    init(_ value: Int) {
        self.value = value
        self.count = 1
    }
    
    func increment() {
        count += 1
    }
}

class TopKElement {
    var heap = Heap<Value> { ($0.count > $1.count) || ($0.count == $1.count && $0.value < $1.value) }
    var valueStore = [Int: Value]()
    
    func addElement(_ val: Int) {
        guard let value = valueStore[val] else {
            valueStore[val] = Value(val)
            heap.insert(valueStore[val]!)
            return
        }
        value.increment()
    }
    
    
    func getTopKElement(k: Int) -> [Int] {
        var k = k
        var result = [Value]()
    
        while k > 0,
              !heap.isEmpty,
              let value = heap.remove() {
            result.append(value)
            k -= 1
        }
        
        heap.insert(result)
        
        return result.map { $0.value }
    }
}

var obj = TopKElement()

obj.addElement(4)
obj.addElement(5)
obj.addElement(4)

obj.getTopKElement(k: 3)

obj.addElement(6)
obj.getTopKElement(k: 3)

obj.addElement(5)
obj.getTopKElement(k: 3)

obj.addElement(7)
obj.getTopKElement(k: 3)

obj.addElement(7)
obj.getTopKElement(k: 3)
