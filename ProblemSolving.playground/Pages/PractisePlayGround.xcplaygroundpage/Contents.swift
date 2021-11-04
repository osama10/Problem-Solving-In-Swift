import UIKit
import Network

class View: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard  alpha >= 0.01
                && !isHidden
                && !isUserInteractionEnabled
                && self.point(inside: point, with: event)
        else { return nil }
        
        for subview in subviews.reversed() {
            let convertedPoint = subview.convert(point, from: self)
            if let subview = subview.hitTest(convertedPoint, with: event) {
                return subview
            }
        }
        
        return self
    }
    
}

typealias Parameters = [String: String]
typealias Headers = [String: String]

enum RequestMethod: String {
    case get, post, put, delete
    
    var method: String {
        self.rawValue.uppercased()
    }
}

protocol EndpointProtocol {
    var baseUrl: String { get }
    var absolutePath: String { get }
    var parameter: Parameters { get }
    var header: Headers { get }
    var method: RequestMethod { get }
}

enum NetworkingError: Int, Error {
    
    case noIntertnet = -1009
    case resourceNotFound = 404
    case badRequest = 400
    case tooManyRequests = 429
    case serverError = 500
    case unableToDecode
    case unknown
    
    var errorMesage: String {
        switch self {
        case .noIntertnet:
            return "You are not connected to internet"
        case .resourceNotFound, .badRequest, .unknown, .serverError, .unableToDecode, .tooManyRequests:
            return "Ooops! Something went wrong. Please try later."
        }
    }
    
}



protocol Networking {
    func get<T:Decodable>(endpoint: EndpointProtocol,
                          response: @escaping ((Result<T,NetworkingError>) -> Void))
    //    func delete<T:Decodable>(endpoint: EndpointProtocol,
    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
    //    func put<T:Decodable>(endpoint: EndpointProtocol,
    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
    //    func post<T:Decodable>(endpoint: EndpointProtocol,
    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
}


final class NetworkingManager: Networking {
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func get<T>(endpoint: EndpointProtocol, response: @escaping ((Result<T, NetworkingError>) -> Void)) where T : Decodable {
        guard let request = performRequest(for: endpoint)
        else {
            response(.failure(.badRequest))
            return
        }
        
        session.dataTask(with: request) { data, response, error in
            
            
        }
    }
    
    private func performRequest(for endpoint: EndpointProtocol) -> URLRequest? {
        let requestURL = endpoint.baseUrl + endpoint.absolutePath
        guard var urlComponents = URLComponents(string: requestURL) else {
            return nil
        }
        
        urlComponents.queryItems = endpoint.parameter.compactMap({ param -> URLQueryItem in
            return URLQueryItem(name: param.key, value: param.value)
        })
        
        guard let url = urlComponents.url else { return nil }
        
        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadRevalidatingCacheData,
                                    timeoutInterval: 30)
        urlRequest.httpMethod = endpoint.method.method
        endpoint.header.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return urlRequest
    }
    
}

func scheduledTask(_ times: [Int], _ preRequisites: [[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: times.count)
    var maxTime = Array(repeating: 0, count: times.count)
    var queue = [Int]()
    var indegree = [Int: Int]()
    
    for preRequisite in preRequisites {
        let first = preRequisite[0]
        let second = preRequisite[1]
        graph[first].append(second)
        indegree[second, default: 0] += 1
    }
    
    for node in 0..<times.count {
        if indegree[node, default: 0] == 0 {
            queue.append(node)
            maxTime[node] = times[node]
        }
    }
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        
        for dependent in graph[curr] {
            maxTime[dependent] = max(maxTime[dependent], maxTime[curr] + times[dependent])
            
            if let degree = indegree[dependent] {
                indegree[dependent] = degree - 1
                if indegree[dependent, default: 0] == 0 {
                    queue.append(dependent)
                }
            }
            
        }
    }
    
    return maxTime.max() ?? Int.max
}

scheduledTask([3, 5, 6], [[0, 1], [0, 2]])

func match(_ regex: String, _ words: [String]) -> [String] {
    var result = [String]()
    let regex = Array(regex)
    
    words.forEach { word in
        if isValid(regex, Array(word)) {
            result.append(word)
        }
    }
    
    return result
}

func isValid(_ regex: [Character], _ word: [Character]) -> Bool {
    var regexIndex = 0
    var wordIndex = 0
    
    while regexIndex < regex.count && wordIndex < word.count {
        
        if regex[regexIndex].isLetter {
            if regex[regexIndex] != word[wordIndex] { return false }
            regexIndex += 1
            wordIndex += 1
        } else {
            var digit = ""
            while regexIndex < regex.count
                    && regex[regexIndex] != "*" {
                digit.append(regex[regexIndex])
                regexIndex += 1
            }
            regexIndex += 1
            wordIndex += Int(digit)!
        }
    }
    
    return regexIndex == regex.count && wordIndex == word.count
}


let words = ["world", "word", "would", "wont", "which", "hello", "baaaaaaaaaab"]
let regexes = ["w3*d", "3*d", "4*", "5*", "b10*b", "b5*a4*b"]

regexes.forEach { regex in
    print(match(regex, words))    
}
/*
 ["world", "would"]
 ["word"]
 ["word", "wont"]
 ["world", "would", "which", "hello"]
 ["baaaaaaaaaab"]
 ["baaaaaaaaaab"]

 */
