import Foundation

/// 692

func topKFrequent(_ words: [String], _ k: Int) -> [String] {
    let wordFrequency = words.reduce(into: [String: Int]()) { (map, word) in map[word, default: 0 ] += 1 }
    var priorityQueue = Heap <(String, Int)>{ $0.1 < $1.1 || ($0.1 == $1.1 && $0.0 > $1.0) }
    wordFrequency.forEach {
        priorityQueue.insert($0)
        if priorityQueue.count > k { priorityQueue.remove() }
    }
    var result = [String]()
    (0..<k).forEach { _ in result.append(priorityQueue.remove()!.0) }
    return result.reversed()
}

/// 347
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let numberFrequency = nums.reduce(into: [Int:Int]()) { (map, value) in map[value, default: 0] += 1 }
    var pQueue = Heap<(key:Int, value: Int)> { ($0.value < $1.value) }
    var result = [Int]()
    numberFrequency.forEach { value in
        pQueue.insert(value)
        if pQueue.count > k { pQueue.remove() }
    }
    (0..<k).forEach { _ in result.append(pQueue.remove()!.key) }
    return result.reversed()
}


topKFrequent(["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4)
topKFrequent([1], 1)
