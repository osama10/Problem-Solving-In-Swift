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

func intersectionWhenSorted(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

    let leftArr = nums1.sorted()
    let rightArr = nums2.sorted()

    var left = 0
    var right = 0

    var result = [Int]()

    while left < leftArr.count &&  right < rightArr.count {

        let leftVal = leftArr[left], rightVal = rightArr[right]

        if leftVal == rightVal {
            result.append(rightVal)
            while (left < leftArr.count) && leftVal == leftArr[left] { left += 1 }
            while (right < rightArr.count) && rightVal == rightArr[right] { right += 1 }
        }
        else if leftVal > rightVal { while (right < rightArr.count) && rightVal == rightArr[right] { right += 1 } }
        else { while (left < leftArr.count) && leftVal == leftArr[left] { left += 1 } }
    }

    return result

}

intersectionWhenSorted([1,2,2,1], [2,2])
intersectionWhenSorted([4,9,5], [9,4,9,8,4])

intersection([1,2,2,1], [2,2])
intersection([4,9,5], [9,4,9,8,4])
