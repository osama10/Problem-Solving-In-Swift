class Solution {
    
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        let water = 1
        let earth = 0
        var queue = [(row: Int, col: Int)]()
        var heights = Array(repeating: 
                            Array(repeating: Int.min, count: isWater[0].count), 
                            count: isWater.count)
        let directions = [[0, 1], [0, -1], [1, 0], [-1, 0],]
        for row in 0..<isWater.count {
            for col in 0..<isWater[0].count {
                if isWater[row][col] == water {
                    queue.append((row, col))
                    heights[row][col] = 0
                }
            }
        }
        
        var total = isWater.count * isWater[0].count
        var index = 0
        
		// using removeFirst() was giving TLE so insted used indexing
        while index < total{
            let count = queue.count
            let (row, col) = queue[index]
            let height = heights[row][col]
                
            for dir in directions {
                let nextRow = row + dir[0]
                let nextCol = col + dir[1]
                    
                if nextRow < 0
                || nextRow >= isWater.count
                || nextCol < 0
                || nextCol >= isWater[0].count
                || heights[nextRow][nextCol] != Int.min { continue }
                    heights[nextRow][nextCol] = height + 1
                    queue.append((nextRow, nextCol))
                }
            index += 1
        }
        
        return heights
        
    }
}