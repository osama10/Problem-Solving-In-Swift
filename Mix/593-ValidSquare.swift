class Solution {
func calDistance(_ p1: [Int], _ p2: [Int]) -> Int {
    (p2[1] - p1[1]) * (p2[1] - p1[1]) + (p2[0] - p1[0]) * (p2[0] - p1[0])
}

func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
    var points = [p1, p2, p3, p4]
    points.sort { $0[0] < $1[0]  || $0[0] == $1[0] && $0[1] < $1[1] }
    
    if calDistance(points[0], points[3]) != calDistance(points[1], points[2]) {
        return false
    }
    
    let distance1 = calDistance(points[0], points[1])
    let distance2 = calDistance(points[0], points[2])
    let distance3 = calDistance(points[3], points[2])
    let distance4 = calDistance(points[3], points[1])

    
     return ( distance1 != 0
            && distance1 == distance2
            && distance2 == distance3
            && distance3 == distance4 )
    
}
}
