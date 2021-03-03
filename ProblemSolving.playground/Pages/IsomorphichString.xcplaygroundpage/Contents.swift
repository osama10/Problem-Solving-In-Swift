
import Foundation

/// 205

/// Checking the last occurence of each char in the sequence
//func isIsomorphic(_ s: String, _ t: String) -> Bool {
//
//    let sArray  = Array(s)
//    let tArray = Array(t)
//
//    var sLastOccurence = [String.Element: Int]()
//    var tLastOccurence = [String.Element: Int]()
//
//    for index in 0..<s.count {
//        let sChar = sArray[index]
//        let tChar = tArray[index]
//        if sLastOccurence[sChar] != tLastOccurence[tChar] { return false }
//        sLastOccurence[sChar] = index
//        tLastOccurence[tChar] = index
//    }
//
//    return true
//}


/// using ASCII
func isIsomorphic(_ s: String, _ t: String) -> Bool {

    let sArray  = Array(s.unicodeScalars)
    let tArray = Array(t.unicodeScalars)

    var a = Array(repeating: -1, count: 256)
    var b = a

    for index in 0..<s.count {
        let sKey = Int(sArray[index].value), tKey = Int(tArray[index].value)
        if a[sKey] != b[tKey] { return false }
        a[sKey] = index
        b[tKey] = index
    }

    return true
}

isIsomorphic("aa", "ab")


