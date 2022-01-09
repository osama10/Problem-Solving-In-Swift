func longestPalindrome(_ s: String) -> String {
    var dp : [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    let sArr = s.map{ String($0)}
    var row = 0
    var col = 0
    var maxLength = 1
    
    for i in 0..<s.count {
        dp[i][i] = true
    }
    
    for start in stride(from: s.count - 1, to: -1, by: -1) {
        for end in start + 1..<s.count {
            if sArr[start] == sArr[end] {
                if end - start == 1 || dp[start + 1][end - 1] {
                    let count = end - start + 1
                    dp[start][end] = true
                    if maxLength < count {
                        row = start
                        col = end
                        maxLength = count
                    }
                }
            }
        }
    }
        
    return sArr[row...col].reduce("", +)
}

class Solution2 {

    func longestPalindrome(_ s: String) -> String {
        let expression = Array(s)
        var memo = Array(repeating:
                        Array(repeating: -1, count: expression.count),
                     count: expression.count)
        let count = lengthOfLPSubstring(expression, 0, expression.count - 1, &memo)
        return printLPS(&memo, count, expression)
    }

    func lengthOfLPSubstring(_ expression: [Character], _ start: Int, _ end: Int, _ memo: inout [[Int]]) -> Int {

        if start == end {
            return 1
        }

        if start > end {
            return 0
        }

        if memo[start][end] == -1 {
            if expression[start] == expression[end] {
                let totalLen = end - start - 1
                let lengthOfSubsting = lengthOfLPSubstring(expression, start + 1, end - 1, &memo)

                if  lengthOfSubsting == totalLen {
                    memo[start][end] = totalLen + 2
                    return memo[start][end]
                }
            }

                let withoutStart = lengthOfLPSubstring(expression, start + 1, end, &memo)
                let withoutEnd = lengthOfLPSubstring(expression, start, end - 1, &memo)
                memo[start][end] = max(withoutStart, withoutEnd)

        }

        return memo[start][end]
    }

        func printLPS(_ memo: inout [[Int]], _ count: Int, _ expression: [Character]) -> String {
            if count <= 0 {
                return ""
            }

            var start = 0
            var end = 0

            for i in 0..<memo.count {
                for j in 0..<memo[0].count {
                    if memo[i][j] == count && (j - i + 1) == count{
                        start = i
                        end = j
                        break
                    }
                }
            }

            return String(expression[start...end])
    }
}
