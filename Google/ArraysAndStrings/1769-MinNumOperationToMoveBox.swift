/*
So the technique to solve this question in O(n) is similar to product except self question.
what we have to do is to calculate the cost of left and right of a number . Now what is the cost. It's the distance of all 1's left and right of a number. So this how I calculate this

- Keep a count variable. 

- for left cost calculation
- increment count by 1 if last element was a 1
	- this will count all the ones left of current index
	- then the cost  will be the cost of the last element + the count

- for right cost calculation
- increment count by 1 if  element after current index was  1
	- this will count all the ones right of current index
	- then the cost  will be the cost of the  element next to current index + the count
- add result[i] = righCost[i] + leftCost[i]
*/

class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        var total = boxes.count
        
        var result = Array(repeating: 0, count: boxes.count)
        var leftCost = Array(repeating: 0, count: boxes.count)
        var rightCost = Array(repeating: 0, count: boxes.count)
        
        let boxes = Array(boxes)
        var count = 0
        
        for i in 1..<total {
            if boxes[i - 1] == "1" {
                count += 1
            }
            
            leftCost[i] = leftCost[i - 1] + count
        }
        
        count = 0
        
        for i in stride(from: total - 2, to: -1, by: -1) {
            if boxes[i + 1] == "1" {
                count += 1
            }
            
            rightCost[i] = rightCost[i + 1] + count
        }
        
        
        for i in 0..<total {
            result[i] = leftCost[i] + rightCost[i]
        }
        
        return result
    }
}