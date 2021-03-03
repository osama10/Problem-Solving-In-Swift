import Foundation


class Solution {
    var frequencyItem = [Int]()
    init(_ w: [Int]) {
        let total = Double(w.reduce(0, +))
        for index in 0..<w.count {
            let frequecy = Int((Double(w[index]) / total * 100 ))
            frequencyItem.append(contentsOf: Array(repeating: index, count: frequecy))
        }
    }

    func pickIndex() -> Int {
        if frequencyItem.isEmpty { return 0 }
        if frequencyItem.count == 1 { return  frequecy[0] }
        let index = Int.random(in: 0..<frequencyItem.count)
        return frequencyItem[index]
    }
}
