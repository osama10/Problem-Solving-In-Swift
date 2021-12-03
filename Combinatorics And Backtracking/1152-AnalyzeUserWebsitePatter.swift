class Solution {
    func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
        var websiteScore = [String: Set<String>]()
        var userHistory = [String: [(String, Int)]]()
		
		// First group data by user
        for i in 0..<username.count {
            userHistory[username[i], default: []].append((website[i], timestamp[i]))
        }
		
		// sort grouped data by timestamp
        userHistory.forEach { (user,data) in
            userHistory[user]?.sort{ $0.1 < $1.1 }
        }

        var pattern = [String]()
		
		// For every user generate patter and gather the website score for 3 visits
        for (user, data) in userHistory {
			if data.count < 3 { continue }
            patternCount(user, data, 0, &pattern, &websiteScore)
        }

        let result = websiteScore
            .sorted { $0.value.count > $1.value.count
                || $0.value.count == $1.value.count && $0.key < $1.key }

        return result[0].key
            .split(separator: "-")
            .map(String.init)
    }

func patternCount(_ user: String ,_ websites: [(String, Int)], _ start: Int , _ pattern: inout [String],_ websiteScore: inout [String: Set<String>]) {
    if pattern.count == 3 {
        websiteScore[pattern.joined(separator: "-"), default: []].insert(user)
    } else {
        if start < websites.count {
            for index in start...websites.count-1 {
                pattern.append(websites[index].0)
                patternCount(user, websites, index + 1, &pattern, &websiteScore)
                pattern.removeLast()
            }
        }
    }
}
    
}