// 350
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var intesection = [Int]()

    var dict = [Int:Int]()

    nums1.forEach { dict[$0] = (dict[$0] ?? 0) + 1 }
    nums2.forEach { num in
        if let count = dict[num], count > 0 {
            intesection.append(num)
            dict[num] = count - 1
        } else { dict[num] = nil }
    }
    return intesection
}