class Solution {
var memo = [String: Int]()

func minCost(_ costs: [[Int]]) -> Int {
      getMinCost(costs, 0, -1)
  }
  
  func getMinCost(_ costs: [[Int]], _ current: Int, _ chosenColor: Int) -> Int {
      if current == costs.count {
          return 0
      }
      
      let key  = "\(current)-\(chosenColor)"
      var minCost = Int.max

      if memo[key] == nil {
          let houseCosts = costs[current]
          
            for (color, thisColorCost) in houseCosts.enumerated() {
                  if color != chosenColor {
                      let costOfChoosingThisColor = getMinCost(costs, current + 1, color)
                      minCost = min(minCost, costOfChoosingThisColor + thisColorCost)
                  }
              }
          memo[key] = minCost
      }

      return memo[key]!
  }
}