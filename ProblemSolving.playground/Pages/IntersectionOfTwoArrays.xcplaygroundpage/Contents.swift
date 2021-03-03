import Foundation

/// 349
//func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    let bigArray = nums1.count >= nums2.count ? nums1 : nums2
//    let smallArray = nums1.count < nums2.count ? nums1 : nums2
//    var set = bigArray.reduce(into: Set<Int>()){ (set, value) in set.insert(value) }
//    var intersection = [Int]()
//
//    smallArray.forEach { value in
//        if set.contains(value) {
//            intersection.append(value)
//            set.remove(value)
//        }
//    }
//
//    return intersection
//}

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Set(nums1).intersection(Set(nums2)).map { $0 }
}

