import Cocoa

/*
 --------------------------
        LinkedList
 --------------------------

 is a data structure base on nodes that are linked to each
 others by pointers or references.
 
 --------------------------
 time and memory complexity
 --------------------------
 1. preapend O(1)
 2. append O(1)
 3. lookup O(n)
 4. Insert O(n)
 5. delete O(n)
 
 --------------------------
 */

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList {
    var head: Node?
    
    func append(_ value: Int) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = newNode
    }
    
    func preappend(_ value: Int) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
    }
    
    func deleteWithValue(_ value: Int) {
        if head != nil {
            if head?.value == value {
                head = head?.next
                return
            }
            var current = head
            while current?.next != nil {
                if current?.next?.value == value {
                    current?.next = current?.next?.next
                    break
                }
                current = current?.next
            }
        }
    }
    
    func getAll() {
        var current = head
        while current?.next != nil {
            print(current?.value ?? 0)
            current = current?.next
        }
        print(current?.value ?? 0)
    }
}


//Declaration
let example = LinkedList()

print("--------------------------")
print("Append")
print("--------------------------")
for number in 1...10 {
    example.append(number)
}
example.getAll()
print("--------------------------")
print("Preappend")
print("--------------------------")
for number in 20...30 {
    example.preappend(number)
}
example.getAll()
print("--------------------------")
print("Delete value of first, last and any")
print("--------------------------")
example.deleteWithValue(10)
example.deleteWithValue(30)
example.deleteWithValue(21)
example.getAll()



