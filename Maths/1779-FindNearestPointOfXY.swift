class Solution {
    typealias Point = (x: Int, y: Int)
    
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        let p1: Point = (x, y)
        
        var result = (dist: Int.max, i: -1)
        
        for (i, point) in points.enumerated() {
            let p2 = (point[0], point[1])
            if isValid(p1, p2) {
                let dist = calDistance(p1, p2)

                if result.dist > dist {
                    result = (dist, i)
                } else if result.dist == dist {
                     result = (dist, min(result.i, i))
                }
            }
        }
        
        return result.i
    }
    
    func isValid(_ p1: Point, _ p2: Point) -> Bool {
        p1.x == p2.x || p1.y == p2.y
    }
    
    func calDistance(_ p1: Point, _ p2: Point) -> Int {
        abs(p1.x - p2.x) + abs(p1.y - p2.y)
    }
}