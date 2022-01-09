func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    var memo = [String: Int]()
    return mincostTickets(days, costs, 0, -1, &memo)
}

func mincostTickets(_ days: [Int], _ cost: [Int], _ index: Int, _ currentDay: Int, _ memo: inout [String: Int]) -> Int {
    if index == days.count {
        return 0
    }
    
    let key = "\(index)-\(currentDay)"
    
    if let cost = memo[key] {
        return cost
    }
    
    if currentDay != -1 && currentDay >= days[index] {
        return mincostTickets(days, cost, index + 1, currentDay, &memo)
    }
    
    let cost0 = mincostTickets(days, cost, index + 1, days[index], &memo) + cost[0]
    let cost1 = mincostTickets(days, cost, index + 1, days[index] + 6, &memo) + cost[1]
    let cost2 = mincostTickets(days, cost, index + 1, days[index] + 29, &memo) + cost[2]
    
    memo[key] = min(cost0, cost1, cost2)
    return min(cost0, cost1, cost2)
}
