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
