class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
       let sortedArray = arr.enumerated()
            .reduce(into: [Int: [Int]]()) {
                $0[$01.element, default: [Int]()].append($1.offset)
            }.sorted { $0.key < $1.key }

        var result = Array(repeating: 1, count: arr.count)
        var rank = 1


        for val in sortedArray {
            for index in val.value {
                result[index] = rank
            }
            rank += 1
        }

        return result
    }
}