import Foundation

public struct Vertex<T> {

    public let index: Int
    public let data: T
}

extension Vertex: Hashable where T: Hashable{ }

extension Vertex: Equatable where T: Equatable { }

extension Vertex: CustomStringConvertible {
    public var description: String { "\(index): \(data)"  }
}

public struct Edge<T> {

    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}

public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {

    associatedtype Element
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectionEdge(from edge1: Vertex<Element>, to edge2: Vertex<Element>, weight: Double?)
    func addUnDirectionEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(edge:EdgeType, from edge1: Vertex<Element>, to edge2: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>,to destination: Vertex<Element>) -> Double?

}

extension Graph {

    public func addUnDirectionEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        addDirectionEdge(from: source, to: destination, weight: weight)
        addDirectionEdge(from: destination, to: source, weight: weight)
    }

    public func add(edge:EdgeType, from edge1: Vertex<Element>, to edge2: Vertex<Element>, weight: Double?) {
        edge == .directed
            ? addDirectionEdge(from: edge1, to: edge2, weight: weight)
            : addUnDirectionEdge(between: edge1, and: edge2, weight: weight)
    }

}

/// **Adjacency List**
public class AdjacencyList<T: Hashable>: Graph {

    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]


    public init() {}

    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex<T>(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }

    public func addDirectionEdge(from edge1: Vertex<T>, to edge2: Vertex<T>, weight: Double?) {
        let newEdge = Edge(source: edge1, destination: edge2, weight: weight)
        adjacencies[edge1]?.append(newEdge)
    }

    public func edges(from source: Vertex<T>) -> [Edge<T>] { adjacencies[source] ?? [] }

    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        edges(from: source)
            .first { $0.destination == destination }?
            .weight
    }
}

extension AdjacencyList: CustomStringConvertible {

  public var description: String {
    var result = ""
    for (vertex, edges) in adjacencies { // 1
      var edgeString = ""
      for (index, edge) in edges.enumerated() { // 2
        if index != edges.count - 1 {
          edgeString.append("\(edge.destination), ")
        } else {
          edgeString.append("\(edge.destination)")
        }
      }
      result.append("\(vertex) ---> [ \(edgeString) ]\n") // 3
    }
    return result
  }
}

/// **Adjacency Matrix**
public class AdjacencyMatrix<T>: Graph {

  private var vertices: [Vertex<T>] = []
  private var weights: [[Double?]] = []

  public init() {}

    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex<T>(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0..<weights.count { weights[i].append(nil) }
        let row = [Double?](repeating: nil, count: vertices.count)
        weights.append(row)
        return vertex
    }

    public func addDirectionEdge(from edge1: Vertex<T>, to edge2: Vertex<T>, weight: Double?) {
        weights[edge1.index][edge2.index] = weight
    }

    public func edges(from source: Vertex<T>) -> [Edge<T>] {
//        let edgeIndexes = Set(weights[source.index]
//            .enumerated()
//            .filter { $0.element != nil }
//            .map{ $0.offset })
//
//        let edges = vertices.enumerated().filter{ edgeIndexes.contains($0.offset) }.map{ $0.element }
//        return edges.map{ Edge(source: source, destination: $0, weight: weights[source.index][$0.index]) }

        var edges: [Edge<T>] = []
          for column in 0..<weights.count {
            if let weight = weights[source.index][column] {
              edges.append(Edge(source: source,
                                destination: vertices[column],
                                weight: weight))
            }
          }

        return edges

    }

    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? { weights[source.index][destination.index] }
}

extension AdjacencyMatrix: CustomStringConvertible {

  public var description: String {
    // 1
    let verticesDescription = vertices.map { "\($0)" }
                                      .joined(separator: "\n")
    // 2
    var grid: [String] = []
    for i in 0..<weights.count {
      var row = ""
      for j in 0..<weights.count {
        if let value = weights[i][j] {
          row += "\(value)\t"
        } else {
          row += "ø\t\t"
        }
      }
      grid.append(row)
    }
    let edgesDescription = grid.joined(separator: "\n")
    // 3
    return "\(verticesDescription)\n\n\(edgesDescription)"
  }
}

