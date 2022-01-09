class Solution {
     func uniqueLetterString(_ S: String) -> Int {
        var dict:[Character:[Int]] = [:]
        var arrayS = Array(S)
        var res = 0
        
        for i in 0..<arrayS.count{
            if dict[arrayS[i]] == nil{
                dict[arrayS[i]] = [0, i]
            }else{
                res += (dict[arrayS[i]]!.last! - dict[arrayS[i]]!.first! + 1) * (i - dict[arrayS[i]]!.last!)
                dict[arrayS[i]]![0] = dict[arrayS[i]]!.last! + 1
                dict[arrayS[i]]![1] = i
            }
        }
         
        for value in dict.values{
            res += (value.last! - value.first! + 1) * (arrayS.count - value.last!)
        }
        return res 
    }
}