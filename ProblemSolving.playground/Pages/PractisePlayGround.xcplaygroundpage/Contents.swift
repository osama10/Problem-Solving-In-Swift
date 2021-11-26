//import UIKit
//import Network
//
//class View: UIView {
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        guard  alpha >= 0.01
//                && !isHidden
//                && !isUserInteractionEnabled
//                && self.point(inside: point, with: event)
//        else { return nil }
//
//        for subview in subviews.reversed() {
//            let convertedPoint = subview.convert(point, from: self)
//            if let subview = subview.hitTest(convertedPoint, with: event) {
//                return subview
//            }
//        }
//
//        return self
//    }
//
//}
//
//typealias Parameters = [String: String]
//typealias Headers = [String: String]
//
//enum RequestMethod: String {
//    case get, post, put, delete
//
//    var method: String {
//        self.rawValue.uppercased()
//    }
//}
//
//protocol EndpointProtocol {
//    var baseUrl: String { get }
//    var absolutePath: String { get }
//    var parameter: Parameters { get }
//    var header: Headers { get }
//    var method: RequestMethod { get }
//}
//
//enum NetworkingError: Int, Error {
//
//    case noIntertnet = -1009
//    case resourceNotFound = 404
//    case badRequest = 400
//    case tooManyRequests = 429
//    case serverError = 500
//    case unableToDecode
//    case unknown
//
//    var errorMesage: String {
//        switch self {
//        case .noIntertnet:
//            return "You are not connected to internet"
//        case .resourceNotFound, .badRequest, .unknown, .serverError, .unableToDecode, .tooManyRequests:
//            return "Ooops! Something went wrong. Please try later."
//        }
//    }
//
//}
//
//
//
//protocol Networking {
//    func get<T:Decodable>(endpoint: EndpointProtocol,
//                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//    //    func delete<T:Decodable>(endpoint: EndpointProtocol,
//    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//    //    func put<T:Decodable>(endpoint: EndpointProtocol,
//    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//    //    func post<T:Decodable>(endpoint: EndpointProtocol,
//    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//}
//
//
//final class NetworkingManager: Networking {
//    let session: URLSession
//
//    init(session: URLSession = URLSession.shared) {
//        self.session = session
//    }
//
//    func get<T>(endpoint: EndpointProtocol, response: @escaping ((Result<T, NetworkingError>) -> Void)) where T : Decodable {
//        guard let request = performRequest(for: endpoint)
//        else {
//            response(.failure(.badRequest))
//            return
//        }
//
//        session.dataTask(with: request) { data, response, error in
//
//
//        }
//    }
//
//    private func performRequest(for endpoint: EndpointProtocol) -> URLRequest? {
//        let requestURL = endpoint.baseUrl + endpoint.absolutePath
//        guard var urlComponents = URLComponents(string: requestURL) else {
//            return nil
//        }
//
//        urlComponents.queryItems = endpoint.parameter.compactMap({ param -> URLQueryItem in
//            return URLQueryItem(name: param.key, value: param.value)
//        })
//
//        guard let url = urlComponents.url else { return nil }
//
//        var urlRequest = URLRequest(url: url,
//                                    cachePolicy: .reloadRevalidatingCacheData,
//                                    timeoutInterval: 30)
//        urlRequest.httpMethod = endpoint.method.method
//        endpoint.header.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
//
//        return urlRequest
//    }
//
//}


//typealias Info = (node: String, request: Int, mutexId: String)
//func detectDeadlock(_ data:[Info]) -> Int {
//    var acquired = [String: String]()
//    var waitingList = [String: [String]]()
//
//    var graph = [String: Set<String>]()
//
//    for info in data {
//        if info.request == 1 {
//            acquired[info.mutexId] = nil
//            graph[info.node, default: Set<String>()].remove(info.mutexId)
//
//            if var candidates = waitingList[info.mutexId],
//                !candidates.isEmpty{
//                graph[candidates.removeFirst(), default: Set<String>()].insert(info.mutexId)
//                waitingList[info.mutexId] = candidates
//            }
//
//        } else {
//            if acquired[info.mutexId] != nil {
//                graph[info.mutexId, default: Set<String>()].insert(info.node)
//                waitingList[info.mutexId, default: []].append(info.node)
//            } else {
//                graph[info.node, default: Set<String>()].insert(info.mutexId)
//            }
//
//        }
//
//        // do dfs
//    }
//
//    return -1
//}


//var index = 0
//
//func calculate(_ s: String) -> Int {
//    evaluateExpression(Array(s.replacingOccurrences(of: " ", with: "")))
//}
//
//func evaluateExpression(_ expression: [Character]) -> Int {
//    guard index < expression.count else { return 0 }
//    var number = 0
//    var operand = 1
//    var result = 0
//
//    while index < expression.count {
//        let char = expression[index]
//        index += 1
//        if char.isNumber {
//            number = number * 10 + Int(String(char))!
//        } else if char == "("{
//            number = evaluateExpression(expression)
//        } else if char == ")" {
//            break
//        } else {
//            result += number * operand
//            number = 0
//            operand = char == "+" ? 1 : -1
//        }
//    }
//
//    return result + (number * operand)
//}

//func braceExpansionII(_ expression: String) -> [String] {
//            []
//}
//
//func expandExpression(_ expression: [Character]) -> Set<String> {
//    var curr = Set<String>()
//    var result = Set<String>()
//
//    while index < expression.count {
//        let char = expression[index]
//
//        if char.isLetter {
//            let letters = parseLetters(expression)
//            if curr.isEmpty {
//                curr.insert(letters)
//            } else {
//
//            }
//        }
//    }
//}
//
//func parseLetters(_ expression: [Character]) -> String {
//    var result = ""
//
//    while index < expression.count && expression[index].isLetter {
//        result.append(expression[index])
//        index += 1
//    }
//
//    return result
//}

func decodeString(_ s: String) -> String {
    var result = ""
    var number = 0
    var stack = [(prev: String, freq: Int)]()
    
    for char in s {
        switch char {
        case _ where char.isNumber:
            number = number * 10 + Int(String(char))!
        case "[":
            stack.append((result, number))
            number = 0
            result = ""
        case "]":
            let last = stack.removeLast()
            result = last.prev + String(repeating: result, count: last.freq)
            stack.append((prev: result, freq: number))
        default:
            result.append(char)
        }
    }
    
    return result
}

func canCross(_ stones: [Int]) -> Bool {
    canCrossRiver(stones, 1)
}

func canCrossRiver(_ stones: [Int], _ index: Int) -> Bool {
    print(index)
    if index > stones.count - 1 {
        return false
    }
    
    if index == stones.count - 1 {
        return true
    }
    
    let k = stones[index]
    
    if k > index {
        if canCrossRiver(stones, k) {
            return true
        }
    }
    
    if k + 1 > index {
        if canCrossRiver(stones, k + 1) {
            return true
        }
    }
    
    if k - 1 > index {
        print("k-1", k-1, index)
        if canCrossRiver(stones, k - 1) {
            return true
        }
    }
    
    return false
}

canCross([0,1,2,3,4,8,9,11])

func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var queue = [(node: root, column: 0)]
    var result = [[Int]]()
    var dict = [Int: Heap<Int>]()
    var minCol = Int.max
    var maxCol = Int.min
    
    while !queue.isEmpty {
        let (node, column) = queue.removeFirst()
        dict[column, default: Heap<Int>(sort: < )].insert(node.val)
        
        minCol = min(minCol, column)
        maxCol = max(maxCol, column)
        
        if let leftChild = node.left {
            queue.append((leftChild, column - 1))
        }
        
        if let rightChild = node.right {
            queue.append((rightChild, column + 1))
        }
    }
    
    
    for i in minCol...maxCol {
        if let child = dict[i] {
            while child.isEm
            result.append(child)
        }
    }
    
    return result
}
