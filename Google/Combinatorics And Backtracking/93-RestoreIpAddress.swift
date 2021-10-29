class Solution {
var validIps = [String]()
var ipNums = [String]()

func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count >= 4 && s.count <= 12 else { return [] }
        generateValidIp(Array(s), 0)
        return validIps
}


func generateValidIp(_ nums: [Character], _ start: Int) {
    
    if start == nums.count && ipNums.count == 4 {
        validIps.append(ipNums.joined(separator: "."))
        return
    }
    
    if start >= nums.count {
        return
    }
    
    var currNum = ""
   
    
    if nums[start] == "0" {
        ipNums.append("0")
        generateValidIp(nums, start + 1)
        ipNums.removeLast()
    }
    else {
        for i in start..<nums.count {
            currNum.append(nums[i])

            if Int(currNum)! > 255 { break }
            
            ipNums.append(currNum)
            generateValidIp(nums, i + 1)
            ipNums.removeLast()
        }
    }
 
}
}