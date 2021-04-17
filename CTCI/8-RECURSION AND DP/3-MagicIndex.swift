/// 8.3 Magic Index: A magic index in an array A[ 1.•.n-1] is defined to be an index such that A[ i]
/// i. Given a sorted array of distinct integers, write a method to find a magic index, if one exists, in array A.

func findMagicIndex(_ arr: [Int]) -> Int {
    if arr.isEmpty { return -1 }
    if arr.count == 1 { return arr.first! == 0 ? 0 : -1 }
    return binSearch(0, arr.count - 1, arr)
}


func binSearch(_ lo: Int, _ hi: Int, _ arr: [Int]) -> Int {
    
    if lo > hi { return -1 }
    let mid = lo + (hi - lo)/2
    if mid == arr[mid] { return mid }
    if arr[mid] > mid { return binSearch(lo, mid - 1, arr) }
    else { return binSearch(mid + 1, hi, arr) }

}

let example1 = [-40, 1, 6, 8, 9, 10]
let example2 = [-40, -20, -1, 1, 2, 3,5, 7, 9, 12, 13]

findMagicIndex(example1)
findMagicIndex(example2)

/// FOLLOW UP
/// What if the values are not distinct?

func findMagicIndexWhenNotDistinct(_ arr: [Int]) -> Int {
    if arr.isEmpty { return -1 }
    if arr.count == 1 { return arr.first! == 0 ? 0 : -1 }
    return binSearchNotDistinct(0, arr.count - 1, arr)
}

func binSearchNotDistinct(_ lo: Int, _ hi: Int, _ arr: [Int]) -> Int {
    if lo > hi { return -1 }
    
    let mid = lo + (hi - lo)/2
    if mid == arr[mid] { return mid }
    
    let leftVal = binSearchNotDistinct(lo, min(mid - 1, arr[mid]), arr)
    if leftVal >= 0 { return leftVal }
    
    let rightVal = binSearchNotDistinct(max(mid + 1, arr[mid]), hi, arr)
    return rightVal
}

let example3 = [-40, -20, 2, 2, 2, 3,5, 7, 9, 12, 13]
findMagicIndexWhenNotDistinct(example1)
findMagicIndexWhenNotDistinct(example1)
findMagicIndexWhenNotDistinct(example3)
