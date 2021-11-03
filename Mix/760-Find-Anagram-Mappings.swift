
/*
 You are given two integer arrays nums1 and nums2 where nums2 is an anagram of nums1. Both arrays may contain duplicates.

 Return an index mapping array mapping from nums1 to nums2 where mapping[i] = j means the ith element in nums1 appears in nums2 at index j. If there are multiple answers, return any of them.

 An array a is an anagram of an array b means b is made by randomizing the order of the elements in a.

  

 Example 1:

 Input: nums1 = [12,28,46,32,50], nums2 = [50,12,32,46,28]
 Output: [1,4,3,2,0]
 Explanation: As mapping[0] = 1 because the 0th element of nums1 appears at nums2[1], and mapping[1] = 4 because the 1st element of nums1 appears at nums2[4], and so on.
 
 Example 2:

 Input: nums1 = [84,46], nums2 = [84,46]
 Output: [0,1]
 */

func anagramMappings(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var mappings = [Int]()
    let dict2 = nums2.enumerated().reduce(into: [Int: Int]()) { partialResult, element in
        partialResult[element.element] = element.offset
    }
    
    nums1.forEach { mappings.append(dict2[$0]!) }
    
    return mappings
}

anagramMappings([84, 46], [84, 46])