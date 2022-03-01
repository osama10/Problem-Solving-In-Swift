class Solution {
    var index = 0

func countOfAtoms(_ formula: String) -> String {
    let atomCount = countAtoms(Array(formula))
        .sorted { $0.key < $1.key }
        .reduce(into: "") { (partialStr, nextValue) in
            let value = nextValue.key + (nextValue.value == 1 ? "" : "\(nextValue.value)")
            partialStr += value
        }
    
    return atomCount
}

func countAtoms(_ formula: [Character]) -> [String: Int]{
    var atomsCount = [String: Int]()

    while index < formula.count {
        let char = formula[index]
        if char.isUppercase {
            var atom = "\(char)"
            index += 1
            
            while index < formula.count && formula[index].isLowercase {
                atom.append(formula[index])
                index += 1
            }
            
            var count = ""
            
            while index < formula.count && formula[index].isNumber {
                count.append(formula[index])
                index += 1
            }
            
            atomsCount[atom, default: 0] += count.isEmpty ? 1 : Int(count)!
        } else if char == "(" {
            index += 1
            let intermediateCount = countAtoms(formula)
            var multiplicity = ""
            
            while index < formula.count && formula[index].isNumber {
                multiplicity.append(formula[index])
                index += 1
            }
            
            let multiplier = multiplicity.isEmpty ? 1 : Int(multiplicity)!
            
            for (key, value) in intermediateCount {
                atomsCount[key, default: 0] += value * multiplier
            }
            
        } else if char == ")" {
            index += 1
            break
        }
    }
    
    return atomsCount
}
}