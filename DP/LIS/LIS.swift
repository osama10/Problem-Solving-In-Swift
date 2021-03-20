/// https://www.geeksforgeeks.org/longest-increasing-subsequence-dp-3/

func longestIncreasingSubsequence(_ arr: [Int]) -> Int {
    var lis = Array(repeating: 1, count: arr.count)
     var subseq = Array(repeating: [Int](), count: arr.count)
     subseq[0] = [arr[0]]
    
    for i in 0..<arr.count {
        for j in 0..<i {
            if arr[i] > arr[j] && lis[i] < (lis[j] + 1) {
                lis[i] = lis[j] + 1
                if i != 0 { subseq[i] = subseq[j] }
            }
        }
        if i != 0 { subseq[i].append(arr[i]) }
    }
    
    print( subseq.filter{ (lis.max() ?? 1 == $0.count) } )
    
    return lis.max() ?? 1
}



longestIncreasingSubsequence([3, 10, 2, 1, 20])
longestIncreasingSubsequence([3, 2])
longestIncreasingSubsequence([50, 3, 10, 7, 40, 80])
