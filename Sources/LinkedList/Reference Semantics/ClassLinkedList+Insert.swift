import Foundation

extension ClassLinkedList {
    /// Appends the given `value` at the end of the list.
    /// - Parameter value: The new node's value.
    public func append(_ value: T) {
        let newNode = ListNode(value)
        
        if let head = self.head {
            var currentNode: ListNode<T> = head
            
            while let nextNode = currentNode.next {
                currentNode = nextNode
            }
            
            currentNode.next = newNode
            self.tail = newNode
        } else {
            /* empty list */
            let node = newNode
            self.head = node
            self.tail = node
        }
    }
    
    /// Inserts the given `value` into the list at the given `index`.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - index: The index of the node to insert the value at.
    public func insert(_ value: T, at index: Int) throws {
        guard index >= 0 else {
            throw LinkedListError.invalidIndex(index)
        }
        
        let newNode = ListNode(value)
        if index == 0 {
            newNode.next = head
            head = newNode
            if tail == nil {
                tail = newNode
            }
            return
        }

        var previousNode = head
        var currentIndex = 0

        while currentIndex < index - 1 && previousNode != nil {
            previousNode = previousNode?.next
            currentIndex += 1
        }

        if let previousNode = previousNode {
            if previousNode.next == nil {
                tail = newNode
            } else if previousNode.next === tail {
                tail?.next = newNode
                return
            }
            newNode.next = previousNode.next
            previousNode.next = newNode
        } else {
            throw LinkedListError.invalidIndex(index)
        }
    }
}

extension ClassLinkedList where T: Equatable {
    /// Inserts the given `value` into the list after the given `after` node.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - after: The node where the insertion will occur.
    /// - Throws: `LinkedListError.unknownNode` if the given `after` node
    /// cannot be found in the list .
    public func insert(_ value: T, after node: ListNode<T>) throws {
        guard head != nil else {
            throw LinkedListError.emptyList
        }
        
        guard tail !== node else {
            /* we're appending to the tail */
            append(value)
            return
        }
        
        let newNode = ListNode(value)
        newNode.next = node.next
        node.next = newNode
    }
    
    /// Inserts the given `value` into the list before the given `before` node.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - before: The node at which to insert the value.
    public func insert(_ value: T, before node: ListNode<T>) throws {
        guard head != nil else {
            throw LinkedListError.emptyList
        }

        let newNode = ListNode(value)
        
        if node === head {
            newNode.next = head
            head = newNode
            return
        }
        
        var currentNode = head
        while let nextNode = currentNode?.next, nextNode !== node {
            currentNode = nextNode
        }
        
        if currentNode?.next === node {
            newNode.next = node
            currentNode?.next = newNode
        } else {
            throw LinkedListError.unknownNode
        }
    }
}
