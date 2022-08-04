class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        dfs(1, nestedList)
    }
    
    func dfs(_ depth: Int, _ nestedList: [NestedInteger]) -> Int {
        var sum = 0
       
        for value in nestedList {
            sum += value.isInteger() ? value.getInteger() * depth : dfs(depth + 1, value.getList())
        }
        
        return sum
    }
}