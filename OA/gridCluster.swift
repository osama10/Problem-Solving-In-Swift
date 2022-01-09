// https://leetcode.com/discuss/interview-question/1469651/amazon-oa-optimization-time-complexity-space-complexity


func gridCluster(grid: [[Int]]) -> Int {
    var ans = 0
    var arr = [Int]()
    
    for row in 0..<grid.count {
        let sum = grid[row].reduce(0, +)
        if sum != 0 {
            arr.append(sum)
        }
    }
    
    for i in 0..<arr.count-1 {
        ans += arr[i] * arr[i + 1]
    }
    
    return ans
}

gridCluster(grid:  [[1, 1, 1], [0, 1, 0], [0, 0, 0],[1,1, 0]])


