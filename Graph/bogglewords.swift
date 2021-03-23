/// https://www.geeksforgeeks.org/boggle-find-possible-words-board-characters/

func boggleWord(_ dict: Set<String>, _ matrix: [[String]]) -> [String]{
    var result = [String]()
    var visited = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            var word = ""
            dfs(matrix, row, col, &visited, &result, &word, dict)
        }
    }
    return result
}


func dfs(_ matrix: [[String]], _ row: Int, _ col: Int, _ visited: inout [[Bool]], _ result: inout [String], _ word: inout String, _ dict: Set<String>) {
    if row < 0 || col < 0 || row >= matrix.count || col >= matrix[0].count || visited[row][col] { return }
    visited[row][col] = true
    word.append(matrix[row][col])
    if dict.contains(word) { result.append(word) }
    for nextRow in row-1...row+1{
        for nextCol in col-1...col+1 {
            dfs(matrix, nextRow, nextCol, &visited, &result,  &word, dict)
        }
    }
    word.removeLast()
    visited[row][col] = false
}

let dict = Set<String>([ "GEEKS", "FOR", "QUIZ", "GO" ])
let boggle = [
    [ "G", "I", "Z" ],
    [ "U", "E", "K" ],
    [ "Q", "S", "E" ]
]

boggleWord(dict, boggle)
