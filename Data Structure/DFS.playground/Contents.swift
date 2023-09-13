import Foundation

// Node
final class Node<T: Hashable> {
    var value: T
    var next: Node<T>? = nil
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

//Stack
final class Stack<T: Hashable> {
    
    private var root: Node<T>?

    func append(_ value: T) {
        self.root = Node(value: value, next: self.root)
    }
    
    func pop() -> T? {
        var curr = self.root
        self.root = self.root?.next
        return curr?.value
    }
}

// Vertex
struct Vertex<T: Hashable>: Hashable {
    let data: T
}

//Edge
struct Edge<T: Hashable>: Hashable {
    let source: Vertex<T>
    let destination: Vertex<T>
}

final class Graph<T: Hashable> {
    private var vertexPerEdges = [Vertex<T>: [Edge<T>]]()
    
    func createVertex(value: T) -> Vertex<T> {
        return Vertex(data: value)
    }
    
    func add(source: Vertex<T>, destination: [Vertex<T>] = []) {
        let edges = destination.map({ Edge(source: source, destination: $0)})
        if let value = self.vertexPerEdges[source] {
            self.vertexPerEdges[source] = value + edges
        } else {
            self.vertexPerEdges[source] = edges
        }
    }
    
    func dfs(for root: Vertex<T>) -> [T] {
        var valueList = [T]()
        let stack = Stack<Vertex<T>>()
        var visitedVertex = Set<Vertex<T>>()
        stack.append(root)
        visitedVertex.insert(root)
        while let vertex = stack.pop(), let edges = self.vertexPerEdges[vertex]  {
            valueList.append(vertex.data)
            for index in stride(from: edges.count-1, to: -1, by: -1) {
                let destination = edges[index].destination
                if !visitedVertex.contains(destination) {
                    visitedVertex.insert(destination)
                    stack.append(destination)
                }
            }
        }
        return valueList
    }
}


let graph: Graph<String> = Graph()

let mock1 = graph.createVertex(value: "A")
let mock2 = graph.createVertex(value: "B")
let mock3 = graph.createVertex(value: "C")
let mock4 = graph.createVertex(value: "D")
let mock5 = graph.createVertex(value: "E")
let mock6 = graph.createVertex(value: "F")
let mock7 = graph.createVertex(value: "G")
let mock8 = graph.createVertex(value: "H")
let mock9 = graph.createVertex(value: "I")

graph.add(source: mock1, destination: [mock2, mock7])
graph.add(source: mock2, destination: [mock3, mock4, mock5])
graph.add(source: mock3)
graph.add(source: mock4)
graph.add(source: mock5, destination: [mock6])
graph.add(source: mock6)
graph.add(source: mock7, destination: [mock8])
graph.add(source: mock8, destination: [mock9])
graph.add(source: mock9)


print(graph.dfs(for: mock1))
