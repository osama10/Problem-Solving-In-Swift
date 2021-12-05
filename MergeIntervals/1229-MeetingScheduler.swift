class Solution {
    func minAvailableDuration(_ slots1: [[Int]], _ slots2: [[Int]], _ duration: Int) -> [Int] {
    let slots1 = slots1.sorted { $0[0] < $1[0] }
    let slots2 = slots2.sorted { $0[0] < $1[0] }
    let possibleAvailibility = getAvailability(slots1, slots2)
    
    for availibility in possibleAvailibility {
        if availibility[1] - availibility[0] >= duration {
            return [availibility[0], availibility[0] + duration]
        }
    }
     
    return []
}

func getAvailability(_ slot1: [[Int]], _ slot2: [[Int]]) -> [[Int]] {
    var availibility = [[Int]]()
    var index1 = 0
    var index2 = 0
    
    while index1 < slot1.count && index2 < slot2.count {
        let time1 = slot1[index1]
        let time2 = slot2[index2]
        
        if intersected(time1, time2) {
            let availableTime = [max(time1[0], time2[0]), min(time1[1], time2[1])]
            availibility.append(availableTime)
        }
        
        if time1[1] < time2[1] {
            index1 += 1
        } else {
            index2 += 1
        }
    }
    
    return availibility
}

func intersected(_ time1: [Int], _ time2: [Int]) -> Bool {
    time1[0] >= time2[0] && time1[0] < time2[1] || time2[0] >= time1[0] && time2[0] < time1[1]
}

}