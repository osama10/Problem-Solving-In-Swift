class Solution {
     let bits = ["0", "1"]
     var presentBits = Set<String>()
    
    func findDifferentBinaryString(_ nums: [String]) -> String {
        presentBits = Set<String>(nums)
        var currentBit = ""
        findCombinations(0, &currentBit, nums.count)
        return currentBit
    }
    
    func findCombinations(_ bitLength: Int, _ currentBit: inout String, _ maxLength : Int) -> Bool {
        if bitLength == maxLength {
            return !presentBits.contains(currentBit)
        }
        
        if bitLength < maxLength {
            for bit in bits {
                currentBit.append(bit)
                if findCombinations(bitLength + 1, &currentBit, maxLength) {
                    return true
                }
                currentBit.removeLast()
            }
        }
        
        return false
    }
}
