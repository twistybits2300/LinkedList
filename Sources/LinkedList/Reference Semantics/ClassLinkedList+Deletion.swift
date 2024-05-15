import Foundation

extension ClassLinkedList {
    /// Removes the node at the given `index`.
    /// - Parameter index: The index of the node to be removed.
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
        
        //while count < index - 1, let nextNode = previousNode?.next {
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
}
