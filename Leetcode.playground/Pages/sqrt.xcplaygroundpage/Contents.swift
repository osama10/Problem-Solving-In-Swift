//: [Previous](@previous)

import Foundation
//69
//func mySqrt(_ x: Int) -> Int {
//    if x < 2 { return x }
//
//    var low = 1
//    var high = x
//
//    while low < high {
//        let mid = (low + high) / 2
//        let sqrs = sqr(mid)
//        if sqrs == x  { return mid }
//        else if ( sqrs > x) { high = mid }
//        else { low = mid + 1}
//    }
//
//    return low - 1
//}
//
//print(mySqrt(11))

//func mySqrt(_ x: Int) -> Int {
//    if x < 2 { return x }
//
//    var low = 1
//    var high = x
//
//    while low < high {
//        let mid = (low + high) / 2
//        let sqrs = sqr(mid)
//        if sqrs == x || (sqrs < x && sqr(mid + 1) > x) { return mid }
//        else if ( sqrs > x) { high = mid }
//        else { low = mid }
//    }
//
//    return -1
//}

func sqrt(_ x: Int) -> Int {
    if x < 2 { return x }

    var low = 1
    var high = x

    while low < high {
        let mid = (low + high)/2

        if mid * mid == x { return mid }
        else if mid * mid > x { high = mid  }
        else { low = mid + 1}
    }

    return low - 1

}
sqrt(8)

//func sqr(_ x: Int) -> Int { x * x }

func binSearch(arr: [Int], x: Int) -> Int {
    if arr.isEmpty { return -1 }
    var low = 0
    var high =  arr.count 

    while low < high {
        let mid = ((high + low))/2
        if arr[mid] == x { return mid }
        else if arr[mid] > x { high = mid - 1}
        else { low =  mid + 1}
    }

    return -1
}


binSearch(arr: [1,2,4,5,6,89,23423,32132131312], x: 0)
binSearch(arr: [1,2,4,5,6,89,23423,32132131312], x: 32132131312)
