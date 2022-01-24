class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let boxTypes = boxTypes.sorted { $0[1] > $1 [1] }
        var truckSize = truckSize
        var maxUnits = 0
        
        for boxType in boxTypes {
            let boxes = min(truckSize, boxType[0])
            let units = boxType[1]
            truckSize -= boxes
            maxUnits += boxes * units
        }
        
        return maxUnits
    }
}