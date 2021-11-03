class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var left = 0
        var right = letters.count - 1
        
        
        while left <= right {
            let mid = (left + right) / 2
            
            if letters[mid] > target {
                right = mid - 1
            } else {
                 left = mid + 1
            }
        }
        
        return letters[left % letters.count]
    }
}