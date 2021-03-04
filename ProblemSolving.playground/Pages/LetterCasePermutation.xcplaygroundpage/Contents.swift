import Foundation

/// 784

func letterCasePermutation(_ S: String) -> [String] {
    var allPermutations = [String]()
    let charArr = Array(S)
    backtrack(0, "", &allPermutations, S: charArr)
    return allPermutations
}


func backtrack(_ index: Int, _ string: String, _ allPermutations : inout [String],  S: Array<String.Element>) {
    if  string.count == S.count {
        allPermutations.append(string)
        return
    }
    if S[index].isNumber { backtrack(index + 1, string + "\(S[index])", &allPermutations, S: S) }
    else {
        backtrack(index + 1, string + S[index].lowercased(), &allPermutations, S: S)
        backtrack(index + 1, string + S[index].uppercased(), &allPermutations, S: S)
    }

}

letterCasePermutation("C")


