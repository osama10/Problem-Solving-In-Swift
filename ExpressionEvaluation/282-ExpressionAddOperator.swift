class Solution {
// Time Complexity : O(4^N)
// Space Complexity: O(N)
func addOperators(_ num: String, _ target: Int) -> [String] {
    var allExpressions = [String]()
    dfs(Array(num), 0, "", 0, 0, target, &allExpressions)
    return allExpressions
}
   
func dfs(_ num: [Character],
               _ start: Int,
               _ expression: String,
               _ value: Int,
               _ prev: Int,
               _ target: Int,
               _ allExpression: inout [String]) {
    
    if start == num.count {
        if value == target {
            allExpression.append(expression)
        }
    } else {
        var currNum = 0
        for index in start..<num.count {
            if index != start && num[start] == "0" { break }
            currNum = currNum * 10 + Int(String(num[index]))!
            
            if start == 0  {
                dfs(num, index + 1, expression + "\(currNum)", currNum, currNum, target, &allExpression)
            } else {
                dfs(num, index + 1, expression + "+\(currNum)", value  + currNum, currNum, target, &allExpression)
              
                dfs(num, index + 1, expression + "-\(currNum)", value - currNum, -currNum, target, &allExpression)
               
                let mulValue = value - prev + ( prev * currNum)
                dfs(num, index + 1, expression + "*\(currNum)", mulValue, prev * currNum, target, &allExpression)
            }
        }
    }
}
}