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
    public func insert(_ value: T, after: ListNode<T>) throws {
        let newNode = ListNode(value)
        
        if let head = self.head {
            if after == head {
                /* inserting at head */
                newNode.next = after.next
                head.next = newNode
            } else {
                var currentNode = head
                
                while let nextNode = currentNode.next {
                    if nextNode == after {
                        if nextNode.next == nil {
                            /* inserting at tail */
                            newNode.next = nextNode.next
                            nextNode.next = newNode
                            return
                        } else {
                            print("currentNode: \(currentNode.value)")
                            print("   nextNode: \(nextNode.value)")
                            newNode.next = nextNode
                            currentNode.next = newNode
                            return
                        }
                    }
                    currentNode = nextNode
                }
                
                throw LinkedListError.unknownNode
            }
        } else {
            /* inserting into empty list */
            self.head = newNode
        }
    }
}
