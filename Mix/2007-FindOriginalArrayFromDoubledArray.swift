class Solution {
func findOriginalArray(_ changed: [Int]) -> [Int] {
     let changed = changed.sorted()
     var numFreqTable = changed.reduce(into: [Int: Int]()){ $0[$1, default: 0] += 1 }
     if changed.count % 2 == 1 { return [] }
     
    var result = [Int]()
     
     for num in changed {
         if numFreqTable[num] == nil { continue }
         let double = 2 * num
         
         guard let numFreq = numFreqTable[num],
               let doubleFreq = numFreqTable[double]
             else { return [] }
         
         result.append(num)
         removeElement(&numFreqTable, num)
         if numFreqTable[double]  == nil { return [] }
         removeElement(&numFreqTable, double)

     }
     
     return result.count == (changed.count / 2) ? result : []
 }
    
    func removeElement(_ numFreqTable: inout [Int: Int], _ num: Int) {
        if let freq = numFreqTable[num] {
            if freq - 1 <= 0 {
                 numFreqTable[num] = nil
            } else {
                 numFreqTable[num] = freq - 1
            }
        } 
    }
}

