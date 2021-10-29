class Solution {
    var directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    func wallsAndGates(_ rooms: inout [[Int]]) {
        var queue = [(row: Int, col: Int)]()
        
        for row in 0..<rooms.count {
            for col in 0..<rooms[0].count {
                if rooms[row][col] == 0 {
                    queue.append((row, col))
                }
            }
        }
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            for direction in directions {
                
                let nextRow = row + direction[0]
                let nextCol = col + direction[1]
                
                if nextRow < 0 
                || nextRow >= rooms.count 
                || nextCol < 0 
                || nextCol >= rooms[0].count 
                || rooms[nextRow][nextCol] != 2147483647 { continue }
                
                rooms[nextRow][nextCol] = rooms[row][col] + 1
                queue.append((nextRow, nextCol))
            }
        }
    }
}