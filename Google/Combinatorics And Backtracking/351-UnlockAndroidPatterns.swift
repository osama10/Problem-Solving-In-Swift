class Solution {

var maxNum = 0
var minNum = 0
var case1 = Set(arrayLiteral: 1, 3, 7, 9)
var case2 = Set(arrayLiteral: 2, 4, 6, 8)
var result = 0

var visited = Array(repeating: false, count: 10)
func numberOfPatterns(_ m: Int, _ n: Int) -> Int {
    maxNum = n
    minNum = m
    
    for curr in 1...9 {
        findValidPatterns(curr, 1)
    }
  
return result
    
}

func findValidPatterns(_ curr: Int, _ total: Int)  {
    if total > maxNum {
        return
    }
    
    if total >= minNum {
        result += 1
    }
	
    visited[curr] = true

    for next in 1...9 {
        if visited[next] {
            continue
        }
        
        if case1.contains(curr) && case1.contains(next) && !visited[(curr + next) / 2] {
            continue
        }
        
        if case2.contains(curr) && 10 - curr == next && !visited[5]{
            continue
        }

        findValidPatterns(next, total + 1)

    }
        visited[curr] = false
}

}