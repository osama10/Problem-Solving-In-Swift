class Solution {
    func unhappyFriends(_ n: Int, _ preferences: [[Int]], _ pairs: [[Int]]) -> Int {
        var preferenceTable = Array(repeating: Array(repeating: 0, count: n), count: n)

        for (row, preference) in preferences.enumerated() {
            for (prefrenceId, col) in preference.enumerated() {
                preferenceTable[row][col] = prefrenceId + 1
            }
        }

        var result = Set<Int>()

        for firstPair in pairs {
            let (x, y) = (firstPair[0], firstPair[1])

            for secPair in pairs {
                if firstPair != secPair {
                    let (u, v) = (secPair[0], secPair[1])

                    if preferenceTable[x][u] < preferenceTable[x][y]
                        && preferenceTable[u][x] < preferenceTable[u][v]
                        || preferenceTable[x][v] < preferenceTable[x][y]
                        && preferenceTable[v][x] < preferenceTable[v][u]{
                        result.insert(x)
                    }

                    if preferenceTable[y][u] < preferenceTable[y][x]
                        && preferenceTable[u][y] < preferenceTable[u][v]
                        || preferenceTable[y][v] < preferenceTable[y][x]
                        && preferenceTable[v][y] < preferenceTable[v][u]{
                        result.insert(y)
                    }
                }
            }
        }

        return result.count
    }
}