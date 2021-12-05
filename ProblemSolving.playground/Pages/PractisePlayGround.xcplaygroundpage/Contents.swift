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

//var index = 0
//
//func braceExpansionII(_ expression: String) -> [String] {
//    Array(parse(Array(expression))).sorted()
//}
//
//func parse(_ expression: [Character]) -> Set<String> {
//    var curr = Set<String>()
//    var res = Set<String>()
//
//    while index < expression.count {
//        let char = expression[index]
//
//        if char.isLetter {
//            let str = parseChar(expression)
//            if curr.isEmpty {
//                curr.insert(str)
//            } else {
//                curr = product(curr, [str])
//            }
//            //index += 1
//
//        } else if char == "{" {
//            index += 1
//            let result = parse(expression)
//            if curr.isEmpty {
//                curr = result
//            } else {
//                curr = product(curr, result)
//            }
//        } else if char == "}" {
//            index += 1
//            break
//        } else {
//            res = res.union(curr)
//            index += 1
//            curr = Set()
//        }
//    }
//
//    return res
//}
//
//
//func product(_ set1: Set<String>, _ set2: Set<String>) -> Set<String> {
//    var product = Set<String>()
//
//    for val1 in set1 {
//        for val2 in set2 {
//            product.insert(val1 + val2)
//        }
//    }
//    print(product)
//    return product
//}
//
//func parseChar(_ expression: [Character]) -> String {
//    var result = ""
//
//    while index < expression.count && expression[index].isLetter {
//        result.append(expression[index])
//        index += 1
//    }
//    //print(result)
//    return result
//}
//
//
//braceExpansionII("{a,b}{c,{d,e}}")

typealias Job = (start: Int, end: Int, profit: Int)
var memo = Array(repeating: -1, count: 5001)

func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
    let jobs: [Job] = startTime
    .enumerated()
    .map { (startTime[$0.offset], endTime[$0.offset], profit[$0.offset]) }
    .sorted{ $0.start < $1.start }
    
    return maxProfit(jobs, 0)
}

func maxProfit(_ jobs: [Job], _ index: Int) -> Int {
    if index >= jobs.count {
        return 0
    }
        
    if memo[index] != -1 {
        return memo[index]
    }
    
    let currentJob = jobs[index]
    let nextIndex = findNextJob(jobs, currentJob.end)
    
    
    let profit1 = maxProfit(jobs, index + 1)
    let profit2 = maxProfit(jobs, nextIndex) + currentJob.profit
    
    memo[index] = max(profit1, profit2)
    return memo[index]
}

func findNextJob(_ jobs: [Job], _ endTime: Int) -> Int {
    var start = 0
    var end = jobs.count - 1
    var nextIndex = jobs.count
    
    while start <= end {
        let mid = (start + end) / 2
        if jobs[mid].start >= endTime {
            nextIndex = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return nextIndex
}
