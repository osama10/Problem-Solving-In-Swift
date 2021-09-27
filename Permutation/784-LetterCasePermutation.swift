///


func letterCasePermutation(_ S: String) -> [String] {
    var allPermutations = [String]()
    backtrack(Array(Array(S)), index: 0, previousStr: "", allPermuations: &allPermutations)
    return allPermutations
}


func backtrack(_ str: Array<String.Element>, index: Int, previousStr: String, allPermuations: inout [String]){
    if str.count == previousStr.count {
        allPermuations.append(previousStr)
        return
    }

    if str[index].isNumber {
        backtrack(str, index: index + 1, previousStr: previousStr + String(str[index]), allPermuations: &allPermuations)
    } else {
        backtrack(str, index: index + 1, previousStr: previousStr + str[index].lowercased(), allPermuations: &allPermuations)
       
        backtrack(str, index: index + 1, previousStr: previousStr + str[index].uppercased(), allPermuations: &allPermuations)
    }
}
