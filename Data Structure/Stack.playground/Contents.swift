import Cocoa

/*
 --------------------------
        Stack
 --------------------------

 is an abstract data type that serves a collection of elements.
 it use LIFO operation, meaning last in is the first out.
 
 --------------------------
 time and memory complexity
 --------------------------
 1  Access(n)
 2. Search O(n)
 3. Insertion O(1)
 4. Deletion O(1)
 --------------------------
 */

class Node<T> {
    let value: T
    var next: Node<T>?
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

class Stack<T> {
    
    private var node: Node<T>?
    
    func push(value: T) {
        let newNode = Node(value: value)
        if node != nil {
            newNode.next = node
            node = newNode
        } else {
            node = newNode
        }
    }
    
    func pop() -> T? {
        let tempNode = node?.next
        node = node?.next
        return tempNode?.value
    }
    
    func peek() -> T? {
        return node?.value
    }
    
    func getAll() {
        var curr = node
        while curr != nil {
            print(curr?.value ?? 0)
            curr = curr?.next
        }
    }
}


let stack = Stack<Int>()

stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)
stack.push(value: 4)
//stack.getAll()
stack.pop()
stack.getAll()
print(stack.peek())
