import Foundation

/// 599
func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {

    var leastIndexSum = Int.max
    var commons = [(String,Int)]()
    var result = [String]()
    let dict2 = list2.enumerated().reduce(into: [String: Int]()){ (map, data) in map[data.element] = data.offset }

    for index1 in 0..<list1.count {
        if let index2 = dict2[list1[index1]] {
            commons.append( (list1[index1], index1 + index2) )
            leastIndexSum = min(leastIndexSum, index1 + index2)
        }
    }

    for common in commons {
        if common.1 == leastIndexSum {
            result.append(common.0)
        }
    }

    return result
}


findRestaurant(["KFC"], ["KFC"])
