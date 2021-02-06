import Foundation
/// 387

func firstUniqChar(_ s: String) -> Int {
    if s.isEmpty { return -1 }
    var frequencyTable = [String.Element: Int]()
    s.forEach { frequencyTable[$0] = (frequencyTable[$0] ?? 0) + 1 }
    for (index, char) in s.enumerated() where frequencyTable[char] == 1 { return index }
    return -1
}
