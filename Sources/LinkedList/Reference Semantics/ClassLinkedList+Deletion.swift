import Foundation

extension ClassLinkedList {
    /// Removes the node at the given `index`.
    /// - Parameter index: The index of the node to be removed.
    /// - Returns: The value of the removed node.
    /// - Throws: `LinkedListError`
    /// `LinkedListError`s thrown:
    /// - `.unableToRemoveNode` when attempting this operation on an empty list.
    /// - `.invalidIndex(index)` when the index is `< 0` or `>` number of nodex in list.
    @discardableResult
    public func remove(at index: Int) throws -> T? {
        guard head != nil else {
            throw LinkedListError.unableToRemoveNode
        }

        guard index >= 0 else {
            throw LinkedListError.invalidIndex(index)
        }
        
        var removedValue: T?
        
        if index == 0 {
            /* we'll be removing the head */
            if head === tail {
                /* this is a list with a single node */
                self.tail = head?.next
            }
            
            removedValue = head?.value
            self.head = head?.next
            return removedValue
        }
        
        var previousNode = head
        var count = 0
        
        while count < index, let nextNode = previousNode?.next {
            if count == index - 1 {
                if nextNode.next == nil {
                    /* we're at the tail */
                    previousNode?.next = nil
                    removedValue = tail?.value
                    self.tail = previousNode
                    return removedValue
                }
                
                /* we're removing `previousNode` */
                removedValue = nextNode.value
                previousNode?.next = nextNode.next
                return removedValue
            }
            
            previousNode = nextNode
            count += 1
        }
        
        /* the given index isn't valid */
        throw LinkedListError.invalidIndex(index)
    }
    
    /// Removes the given `node` from the list.
    /// - Parameter node: The node to be removed.
    /// - Returns: The value of the removed node.
    /// - Throws: `LinkedListError`
    /// `LinkedListErrors` thrown:
    /// - `unableToRemoveNode` if the list is empty
    /// - `.unknownNode` if `node` isn't in the list.
    @discardableResult
    public func remove(node: ListNode<T>) throws -> T? {
        guard head != nil else {
            throw LinkedListError.unableToRemoveNode
        }
        
        var removedValue: T?

        if node === head {
            /* we'll be removing the head */
            if head === tail {
                /* this is a list with a single node */
                self.tail = head?.next
            }
            
            removedValue = head?.value
            self.head = head?.next
            return removedValue
        }
        
        var previousNode = head

        while let nextNode = previousNode?.next {
            if nextNode === node {
                if nextNode.next == nil {
                    /* we're at the tail */
                    previousNode?.next = nil
                    removedValue = tail?.value
                    self.tail = previousNode
                    return removedValue
                }
                
                /* we're removing `previousNode` */
                previousNode?.next = nextNode.next
                removedValue = nextNode.value
                return removedValue
            }
            
            previousNode = nextNode
        }
        
        throw LinkedListError.unknownNode
    }
    
    /// Removes the first node in the list.
    /// - Returns: The value of the removed node.
    /// - Throws: `LinkedListError.unableToRemoveNode` if attempting to remove from an empty list.
    public func removeFirst() throws -> T? {
        guard let head = self.head else {
            throw LinkedListError.unableToRemoveNode
        }
        
        let removedValue = head.value
        self.head = head.next

        if self.head == nil {
            self.tail = nil
        }
        
        return removedValue
    }
    
    /// Removes the last node in the list.
    /// - Returns: The value of the removed node.
    /// - Throws: `LinkedListError.unableToRemoveNode` if attempting to remove from an empty list.
    @discardableResult
    public func removeLast() throws -> T? {
        guard let tail = self.tail else {
            throw LinkedListError.unableToRemoveNode
        }
        
        let removedValue = tail.value
        var previousNode: ListNode<T>? = nil
        var currentNode: ListNode<T>? = head

        if head === tail {
            /* only one node in the list */
            self.head = nil
            self.tail = nil
            return removedValue
        }
        
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode?.next
        }

        previousNode?.next = nil
        self.tail = previousNode
        return removedValue
    }
    
    /// Removes all of the nodes in the list.
    public func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
