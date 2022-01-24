class Solution {
    
func snakesAndLadders(_ board: [[Int]]) -> Int {
		let length = board.count
		var stepMap: [Int : Int] = [1:0]
		var queue = [1]
    
		func get(_ num: Int) -> Int {
			let quot = (num - 1) / length // 4
			let rem = (num - 1) % length // 0
			let row = length - 1 - quot // 4
			let col = (length - row) % 2 == 1 ? rem : (length - 1 - rem)
			return board[row][col] == -1 ? num : board[row][col]
		}

		while !queue.isEmpty {
			let s = queue.removeFirst()
			if s == length * length {
				return stepMap[s]!
			}
        
			for i in 1...6 {
				if s + i > length * length {
					break
				}
				else {
					let s2 = get(s + i)
					if stepMap[s2] == nil {
						stepMap[s2] = stepMap[s]! + 1
						queue.append(s2)
					}
				}
			}
		}
		return -1
	}
}