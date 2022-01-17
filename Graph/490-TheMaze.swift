class Solution {
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
    let directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    var queue = [(row:start[0], col: start[1])]
    var visited = Array(repeating: Array(repeating: false, count: maze[0].count), count: maze.count)
    
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let node = queue.removeFirst()
           
            if destination[0] == node.row && destination[1] == node.col {
                return true
            }

            visited[node.row][node.col] = true
            
            for dir in directions {
                var nextPos = (row: node.row + dir[0], col: node.col + dir[1])

                while (nextPos.row >= 0
                    && nextPos.row < maze.count
                    && nextPos.col >= 0
                    && nextPos.col < maze[0].count
                    && maze[nextPos.row][nextPos.col] == 0) {
                    nextPos = (row: nextPos.row + dir[0], col: nextPos.col + dir[1])
                }
                
                nextPos = (row: nextPos.row - dir[0], col: nextPos.col - dir[1])
                
                if !visited[nextPos.row][nextPos.col] {
                    queue.append(nextPos)
                }
            }
        }
    }
    
    return false
}
}