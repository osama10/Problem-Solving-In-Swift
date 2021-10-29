
class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        guard !firstList.isEmpty && !secondList.isEmpty else { return [] }
        var result = [[Int]]()
        
        var countOfFirst = 0
        var countOfSecond = 0
        
        while countOfFirst < firstList.count && countOfSecond < secondList.count {
            let start1 = firstList[countOfFirst][0]
            let end1 = firstList[countOfFirst][1]
            
            let start2 = secondList[countOfSecond][0]
            let end2 = secondList[countOfSecond][1]
            
            if (intersect(start1, end1, start2, end2) ) {
				
				let startTime =  max(start1, start2)
				let endTime =  min(end1, end2)
                
                let intersection = [startTime, endTime ]
				
                result.append(intersection)
            }
            
            if end1 < end2 {
                countOfFirst += 1
            } else {
                countOfSecond += 1
            }
        }
        
        
        return result
    }
    
    func intersect(_ start1: Int, _ end1: Int, _ start2: Int, _ end2: Int) -> Bool {
        (start1 >= start2 && start1 <= end2
        || start2 >= start1  && start2 <= end1 )
    }
}
