class Solution {

    typealias Pair = (max: Int, min: Int)
    let noValue = (max: Int.min, min: Int.max)

    func maxProduct(_ grid: [[Int]], _ row: Int, _ col: Int, _ memo: inout [String: Pair]) -> Pair {
        let maxRow = grid.count - 1
        let maxCol = grid[0].count - 1
        let key = "\(row)-\(col)"

        if row == maxRow && col == maxCol {
            return (grid[maxRow][maxCol], grid[maxRow][maxCol])
        }

        if let pair = memo[key] {
            return pair
        }

        var result = noValue
        let value = grid[row][col]

        if row + 1 < grid.count {
            let pair = maxProduct(grid, row + 1, col, &memo)

            if pair.max != Int.max && pair.max != Int.min {
                result.max = max(result.max, value * pair.max)
                result.min = min(result.min, value * pair.max)
            }

            if pair.min != Int.max && pair.min != Int.min {
                result.max = max(result.max, value * pair.min)
                result.min = min(result.min, value * pair.min)
            }

        }

        if col + 1 < grid[0].count {
            let pair = maxProduct(grid, row, col + 1, &memo)

            if pair.max != Int.max && pair.max != Int.min {
                result.max = max(result.max, value * pair.max)
                result.min = min(result.min, value * pair.max)
            }

            if pair.min != Int.max && pair.min != Int.min {
                result.max = max(result.max, value * pair.min)
                result.min = min(result.min, value * pair.min)
            }
        }

        memo[key] = result
        return result
    }

    func maxProductPath(_ grid: [[Int]]) -> Int {
        let mod = Int(1e9 + 7)
        let maxRow = grid.count - 1
        let maxCol = grid[0].count - 1

        if grid[0][0] == 0 || grid[maxRow][maxCol] == 0 { return 0 }
        var memo = [String: Pair]()

        let result = maxProduct(grid, 0, 0, &memo)

        return (result.max < 0 ) ? -1 : result.max % mod
    }
    
}