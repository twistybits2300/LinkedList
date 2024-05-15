import Foundation

extension ClassLinkedList {
    /// Appends the given `value` at the end of the list.
    /// - Parameter value: The new node's value.
    public func append(_ value: T) {
        if let head = self.head {
            var currentNode: ListNode<T> = head
            
            while let nextNode = currentNode.next {
                currentNode = nextNode
            }
            
            currentNode.next = ListNode(value)
        } else {
            /* empty list */
            let node = ListNode(value)
            self.head = node
        }
    }
    
    /// Inserts the given `value` into the list at the given `index`.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - index: The index of the node to insert the value at.
    public func insert(_ value: T, at index: Int) {
        let newNode = ListNode(value)
        
        if let head = self.head {
            if index <= 0 {
                /* insert at head */
                newNode.next = self.head
                self.head = newNode
            } else {
                var currentNode = head
                var count = 0
                
                while let nextNode = currentNode.next, count < index - 1 {
                    currentNode = nextNode
                    count += 1
                }
                
                newNode.next = currentNode.next
                currentNode.next = newNode
            }
        } else {
            /* list is empty */
            self.head = newNode
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
    func insert(_ value: T, after node: ListNode<T>) throws {
        guard head != nil else {
            throw LinkedListError.unknownNode
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
}
