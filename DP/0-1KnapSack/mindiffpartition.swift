// https://www.geeksforgeeks.org/partition-a-set-into-two-subsets-such-that-the-difference-of-subset-sums-is-minimum/
func minSubset(_ arr:[Int]) -> Int {
    let sum = arr.reduce(0, +)
    var cache : [[Int?]] = Array(repeating: Array(repeating: nil, count: sum+1), count: arr.count + 1)
    return findMinSubset(arr, sum, 0, arr.count, &cache)
}

func findMinSubset(_ arr: [Int], _ sum: Int, _ calSum: Int, _ index: Int, _ cache: inout [[Int?]]) -> Int {
   
    if index == 0 {
        return abs((sum - calSum) - calSum)
    }
    
    if let difference = cache[index][calSum] {
        return difference
    }
    
    let differenceWithIndex = findMinSubset(arr, sum, calSum + arr[index - 1],  index - 1, &cache)
    
    let differencWithOutIndex = findMinSubset(arr, sum, calSum ,  index - 1, &cache)
    
    cache[index][calSum] = min(differenceWithIndex, differencWithOutIndex)
    
    return cache[index][calSum] ?? 0
}

minSubset([ 3, 1, 4, 2, 2, 1 ])
