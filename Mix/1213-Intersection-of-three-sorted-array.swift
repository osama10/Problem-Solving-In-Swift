/*
 Given three integer arrays arr1, arr2 and arr3 sorted in strictly increasing order, return a sorted array of only the integers that appeared in all three arrays.


 Example 1:

 Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
 Output: [1,5]
 Explanation: Only 1 and 5 appeared in the three arrays.
 
 Example 2:

 Input: arr1 = [197,418,523,876,1356], arr2 = [501,880,1593,1710,1870], arr3 = [521,682,1337,1395,1764]
 Output: []
 */

func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
    let partialIntersection = sortedIntersection(arr1, arr2)
    let result = sortedIntersection(partialIntersection, arr3)
    return result
}

func sortedIntersection(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    guard !arr1.isEmpty,
          !arr2.isEmpty
    else { return [] }
   
    var result = [Int]()
   
    var index1 = 0
    var index2 = 0
        
    while index1 < arr1.count && index2 < arr2.count {
        if arr1[index1] == arr2[index2] {
            result.append(arr1[index1])
            index1 += 1
            index2 += 1
        } else if arr1[index1] < arr2[index2] {
            index1 += 1
        } else {
            index2 += 1
        }
    }
    
    return result
}

arraysIntersection([197,418,523,876,1356], [501,880,1593,1710,1870], [521,682,1337,1395,1764])
