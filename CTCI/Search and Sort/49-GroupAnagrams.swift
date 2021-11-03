class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var group = [String: [String]]()
        
        for str in strs {
            let key = str.sorted()
            group[String(key), default: [String]()].append(str)
        }
        
        return Array(group.values)
    }
}