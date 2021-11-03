class MovingAverage {

    /** Initialize your data structure here. */
    var queue = [Double]()
    let size: Int
    var front = -1
    var rear = -1
    var sum = 0.0
    
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        enque(Double(val))
        return sum/Double(queueSize())
    }
    
    private func enque(_ val: Double) {
        rear += 1
        if front == -1 {
            front = 0
        } else if queueSize() > size {
            sum -= queue[front]
            front += 1
        }
        queue.append(val)
        sum += val
    }
    
    private func queueSize() -> Int { rear - front + 1}
}

let averages = MovingAverage(3)
averages.next(1)
averages.next(10)
averages.next(3)
averages.next(5)
