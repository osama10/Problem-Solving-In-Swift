
import Foundation
/// 49
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String: [String]]()

    for index in 0..<strs.count {
        let word = String(strs[index].sorted())
        dict[word, default: [String]()].append(strs[index])
    }


    return Array(dict.values)
}

print(groupAnagrams(
        ["tea","","eat","","tea",""]))
