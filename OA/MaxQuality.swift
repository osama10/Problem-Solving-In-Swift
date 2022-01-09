func maxQuality(_ packets: [Int], _ channels: Int) -> Int {
    var packets = packets.map(Double.init).sorted()
    var median: Double = 0
    
    for _ in 1..<channels {
        median += packets.removeLast()
    }
    
    if !packets.isEmpty {
        let mid = packets.count / 2
        median += packets.count % 2 == 0
        ? (packets[mid] + packets[mid - 1]) / 2
        : packets[mid]
    }
    
    return Int(median.rounded(.up))
}

maxQuality([2,2,1,5,3], 2)
maxQuality([89, 48, 14], 3)
maxQuality([2,6,3], 2)
maxQuality([2,6,3], 2)
maxQuality([2,6,3], 3)
maxQuality([1,1,2,2,3], 3)
