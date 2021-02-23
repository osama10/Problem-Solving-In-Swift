
import Foundation

/// 1387

func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {

    var result = [(Int, Int)]()
    var map = [1: 1]

    (lo...hi).forEach { result.append(($0, getPower($0, &map))) }

    result.sort { ($0.1 < $1.1 ) || ($0.0 < $1.0 && $0.1 == $0.1) }

    return result[k - 1].0
}

func getPower(_ x: Int, _ memoizedMap: inout [Int: Int]) -> Int {
    if let power = memoizedMap[x] { return power }
    var n = x
    var count = 0
    while n != 1 {
        n = (n % 2 == 0) ? n/2 : ((3 * n) + 1)
        count += 1
    }
    memoizedMap[x] = count
    return count
}

print(getKth(1, 1, 1))
