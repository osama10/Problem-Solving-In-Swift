class Solution {
func letterCasePermutation(_ s: String) -> [String] {
    var result = [String]()
    findLetterCasePermutation(Array(s), 0, "", &result)
    return result
}


func findLetterCasePermutation(_ word: [Character], _ index: Int, _ permutation:  String ,_ result: inout [String]) {
    
    if index == word.count {
        result.append(permutation)
        return
    }
    if word[index].isNumber {
        let permutation = permutation + String(word[index])
        findLetterCasePermutation(word, index + 1, permutation, &result)
    } else {
        findLetterCasePermutation(word, index + 1, permutation + word[index].lowercased(), &result)
        
        findLetterCasePermutation(word, index + 1, permutation + word[index].uppercased(), &result)
    }
    
    
}

}