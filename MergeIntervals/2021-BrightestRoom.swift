class Solution {
func brightestPosition(_ lights: [[Int]]) -> Int {
    let startRanges = lights
       .map { $0[0] - $0[1] }
        .sorted()
    
    let endRanges = lights
       .map { $0[0] + $0[1] }
        .sorted()
    
    var startIndex = 0
    var endIndex = 0
    
    var currLights = 0
    var maxLights = 0
    var brightestArea = 0
    
    while startIndex < startRanges.count {
        let start = startRanges[startIndex]
        let end = endRanges[endIndex]
       
        if start > end {
            endIndex += 1
            currLights -= 1
        }
        
        currLights += 1
        startIndex += 1

        if currLights > maxLights {
            maxLights = currLights
            brightestArea = start
        }
        
    }
       return brightestArea
      
   }
}