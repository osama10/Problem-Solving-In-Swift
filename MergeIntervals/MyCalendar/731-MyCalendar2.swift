class MyCalendarTwo {
    typealias Booking = (start: Int, end: Int)

    var single = [Booking]()
    var double = [Booking]()
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        
        for booking in double {
            if start < booking.end && end > booking.start {
                return false 
            }
        }
        
        for booking in single {
            if start < booking.end && end > booking.start {
                double.append( (max(booking.start, start), min(booking.end, end)) )
            }
        }
        
        single.append((start, end))
        return true
    }
    
 }