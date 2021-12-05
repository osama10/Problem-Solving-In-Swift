class MyCalendar {
    typealias Interval = (start: Int, end: Int)
    var bookings = [Interval]()
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        let interval = (start, end)
        let possibleBookings = insertInterval(interval)
        let canBook = canMakeBooking(possibleBookings, interval)
        if canBook {
            bookings = possibleBookings
        } 

        return canBook
    }
    
    func canMakeBooking(_ bookings: [Interval], _ interval: Interval) -> Bool {
        var prevInterval = bookings[0]
        
        for currInterval in bookings[1..<bookings.count] {
            if prevInterval.end > currInterval.start {
                return false
            } else {
                prevInterval = currInterval
            }
        }
        
        return true
    }
    
    func insertInterval(_ interval: Interval) -> [Interval] {
        var bookings = bookings
        var intervalInserted = false 
        
        for (index, booking) in bookings.enumerated() {
            if booking.start > interval.start {
                bookings.insert(interval, at: index)
                intervalInserted = true
                break
            }
        }
        
        if !intervalInserted {
            bookings.append(interval)
        }
        
        return bookings
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */