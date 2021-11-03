func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    var memo = Array(repeating: -1, count: 366)
    return mincostTickets(Set(days), costs, 1, &memo)
}

func mincostTickets(_ days: Set<Int>, _ costs: [Int], _ day: Int, _ memo: inout [Int]) -> Int {
    
    if days.max()! < day {
        return 0
    }
    
    if memo[day] != -1 {
        return memo[day]
    }
    
    if days.contains(day) {
        let oneDayCost = mincostTickets(days, costs, day + 1, &memo) + costs[0]
        let sevenDayCost = mincostTickets(days, costs, day + 7, &memo) + costs[1]
        let thirtyDayCost = mincostTickets(days, costs, day + 30, &memo) + costs[2]
        
        memo[day] = min(oneDayCost, sevenDayCost, thirtyDayCost)
    } else {
        memo[day] = mincostTickets(days, costs, day + 1, &memo)
    }
    
    return memo[day]
}



mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15])
