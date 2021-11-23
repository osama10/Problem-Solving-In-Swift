class Solution {
    // https://www.youtube.com/watch?v=vvRY7bS4OMI
    func minAreaRect(_ points: [[Int]]) -> Int {
        guard points.count >= 4 else { return 0 }
        var pointMap = [Int: Set<Int>]()
        var minArea = Int.max
    
        for point in points {
            let (x,y) = (point[0], point[1])
            pointMap[x, default: Set<Int>()].insert(y)
        }
    
        for i in 0..<points.count {
            for j in i+1..<points.count {
                let(x1, y1) = (points[i][0], points[i][1])
                let(x2, y2) = (points[j][0], points[j][1])
            
                if x1 != x2 && y1 != y2 {
                    if pointMap[x1, default: Set<Int>()].contains(y2)
                    && pointMap[x2, default: Set<Int>()].contains(y1) {
                        let area = abs(x1 - x2) * abs(y1 - y2)
                        minArea = min(area, minArea)
                    }
                }
            }
        }
    
        return minArea == Int.max ? 0 : minArea
    }

}



/*

x1y1      x2y1

x1y2      x2y2
*/
