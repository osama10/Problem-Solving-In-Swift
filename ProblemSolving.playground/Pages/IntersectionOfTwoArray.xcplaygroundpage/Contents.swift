import Foundation

/// 349

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let smallArray = nums1.count < nums2.count ? nums1 : nums2
    let biggerArray = nums1.count < nums2.count ? nums2 : nums1
    var intesection = [Int]()

    var set = Set<Int>()

    biggerArray.forEach { set.insert($0) }

    smallArray.forEach { num in
        if set.contains(num) {
            intesection.append(num)
            set.remove(num)
        } else { set.remove(num) }
    }
    return intesection
}

print(intersection([], []))
/// 350

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

    let smallArray = nums1.count < nums2.count ? nums1 : nums2
    let biggerArray = nums1.count < nums2.count ? nums2 : nums1
    var intesection = [Int]()

    var dict = [Int:Int]()

    biggerArray.forEach { dict[$0] = (dict[$0] ?? 0) + 1 }
    smallArray.forEach { num in
        if let count = dict[num], count > 0 {
            intesection.append(num)
            dict[num] = count - 1
        } else { dict[num] = nil }
    }
    return intesection
}

intersect([], [])
