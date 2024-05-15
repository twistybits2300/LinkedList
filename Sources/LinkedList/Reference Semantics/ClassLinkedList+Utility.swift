import Foundation

extension ClassLinkedList {
    /// Visits each node in the list, calling the`visitor` closure at each node.
    /// - Parameter visitor: The closure to be called when visiting each node in the list.
    public func traverse(visit visitor: (ListNode<T>) -> Void) {
        var current = head
        
        while let currentNode = current {
            visitor(currentNode)
            current = currentNode.next
        }
    }
    
    /// Returns the node at the given `index`.
    /// - Parameter index: The index of the node to be found.
    /// - Returns: The node at the given `index`; `nil` if not found.
    public func node(at index: Int) -> ListNode<T>? {
        guard head != nil else {
            return nil
        }
        
        var foundNode: ListNode<T>?
        var count = 0
        
        func finder(node: ListNode<T>) {
            if count == index {
                foundNode = node
            }
            count += 1
        }
        
        traverse(visit: finder(node:))
        
        return foundNode
    }
    
    /// Returns the number of nodes currently in the list.
    public var count: Int {
        guard head != nil else {
            return 0
        }
        
        var count = 0
        
        func counter(node: ListNode<T>) {
            count += 1
        }
        
        traverse(visit: counter(node:))
        
        return count
    }
    
    /// Returns `true` if the list has no nodes; `false` otherwise.
    public var isEmpty: Bool {
        head == nil
    }
    
    /// Reverses the list.
    public func reverse() {
        var currentNode = head
        var previousNode: ListNode<T>? = nil
        
        /* we'll traverse the list once flipping the order of the nodes, */
        self.tail = head
        
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        
        self.head = previousNode
    }
    
    /// Makes a copy of this list.
    /// - Returns: A copy of the nodes in this list, in the order they're currently in within this list.
    public func copy() -> ClassLinkedList<T> {
        let clone = ClassLinkedList()

        self.traverse { node in
            let clonedNode = ListNode(node.value, next: node.next)
            clone.append(node: clonedNode)
        }

        return clone
    }

    // MARK: - Utilities
    func swapValues(left leftNode: ListNode<T>, rightNode: ListNode<T>) {
        let leftValue = leftNode.value
        leftNode.value = rightNode.value
        rightNode.value = leftValue
    }

    var asArray: [T] {
        guard let head = head else {
            return []
        }
        
        return head.asArray
    }
}
