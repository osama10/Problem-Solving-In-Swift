func generateAbbreviations(_ word: String) -> [String] {
    var allAbreviations = [String]()
    let word = Array(word)
    abbreviate(word, "", 0, 0, &allAbreviations)
    return allAbreviations
}

func abbreviate(_ word: [Character],
                _ abbreviation: String,
                _ currentIndex: Int,
                _ abbrevCount: Int,
                _ allAbreviations: inout [String]) {

    if word.count == currentIndex {
        if abbrevCount > 0 {
            allAbreviations.append(abbreviation + String(abbrevCount))
        } else {
            allAbreviations.append(abbreviation)
        }
    } else {
        var abbreviation = abbreviation
        abbreviate(word, abbreviation, currentIndex + 1, abbrevCount + 1, &allAbreviations)
        
        if abbrevCount > 0 {
            abbreviation.append(String(abbrevCount))
        }
		
        abbreviation.append(word[currentIndex])
        abbreviate(word, abbreviation, currentIndex + 1, 0, &allAbreviations)
    }
}