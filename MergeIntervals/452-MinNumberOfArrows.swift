class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        /*
        [1, 6]
           [2, 8]
               [7, 12]
                  [10, 12]
        */
        guard points.count > 1 else { return 1 }
        let points = points.sorted{ $0[1] < $1[1] }

        var arrows = 1
        var firstEnd = points[0][1]
        
        for point in points {
            if firstEnd < point[0] {
                arrows += 1
                firstEnd = point[1]
            }
        }
        
        return arrows
    }
}