/**
 * // This is Sea's API interface.
 * // You should not implement it, or speculate about its implementation
 * class Sea {
 *     public func hasShips(_ topRight: [Int], _ bottomLeft: [Int]) -> Bool {}
 * }
 */

// https://leetcode.com/problems/number-of-ships-in-a-rectangle/discuss/1649557/Java-oror-Explained-oror-Divide-and-Conquer-oror-Explained-the-Time-complexity

class Solution {
    func countShips(_ sea: Sea, _ topRight: [Int], _ bottomLeft: [Int]) -> Int {
        if bottomLeft[0] > topRight[0] 
        ||  bottomLeft[1] > topRight[1] 
        || !sea.hasShips(topRight, bottomLeft) {
            return 0
        }
        
        if bottomLeft[0] == topRight[0] && bottomLeft[1] == topRight[1] {
            return 1
        }
        
        let midX = (bottomLeft[0] + topRight[0]) / 2
        let midY = (bottomLeft[1] + topRight[1]) / 2
        
        let count1 = countShips(sea, [midX, midY], bottomLeft)
        let count2 = countShips(sea, [midX, topRight[1]], [bottomLeft[0], midY + 1])
        let count3 = countShips(sea, topRight, [midX+1, midY+1])
        let count4 = countShips(sea, [topRight[0], midY], [midX+1, bottomLeft[1]])

        return count1 + count2 + count3 + count4
    }
}