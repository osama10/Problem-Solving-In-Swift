class Solution {
    func candy(_ ratings: [Int]) -> Int {
        
        var leftCandies = Array(repeating: 1, count: ratings.count)
        var rightCandies = Array(repeating: 1, count: ratings.count)
        var minCandies = 0

        for index in 1..<ratings.count {
            if ratings[index] > ratings[index - 1] {
                leftCandies[index] = leftCandies[index - 1] + 1
            }
        }
        
        for index in stride(from: ratings.count-2, to: -1, by: -1) {
            if ratings[index] > ratings[index + 1] {
                rightCandies[index] = rightCandies[index + 1] + 1
            }
        }
                
        for (leftCandy, rightCandy) in zip(leftCandies, rightCandies) {
            minCandies += max(leftCandy, rightCandy)
        }
        
        return minCandies
    }
}

