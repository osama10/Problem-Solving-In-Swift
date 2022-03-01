class FindSumPairs {

    private var dict1: [Int: Int]
    private var dict2: [Int: Int]
    private var nums2: [Int]

    init(_ nums1: [Int], _ nums2: [Int]) {
        self.dict1 = nums1.reduce(into: [Int: Int](), { $0[$1, default: Int(0)] += 1 })
        self.dict2 = nums2.reduce(into: [Int: Int](), { $0[$1, default: Int(0)] += 1 })
        self.nums2 = nums2
    }
    
    func add(_ index: Int, _ val: Int) {
        dict2[nums2[index], default: Int(0)] -= 1
        nums2[index] += val
        dict2[nums2[index], default: Int(0)] += 1
    }
    
    func count(_ tot: Int) -> Int {
        return dict1.reduce(into: 0) {
            if let val = dict2[tot - $1.0] {
                $0 += $1.1 * val
            }
        }
    }
}