import Foundation

extension ClassLinkedList {
    /// Removes the node at the given `index`.
    /// - Parameter index: The index of the node to be removed.
    /// - Throws: `LinkedListError`
    /// `LinkedListError`s thrown:
    /// - `.unableToRemoveNode` when attempting this operation on an empty list.
    /// - `.invalidIndex(index)` when the index is `< 0` or `>` number of nodex in list.
    public func remove(at index: Int) throws {
        guard head != nil else {
            throw LinkedListError.unableToRemoveNode
        }

        guard index >= 0 else {
            throw LinkedListError.invalidIndex(index)
        }
        
        if index == 0 {
            /* we'll be removing the head */
            if head === tail {
                /* this is a list with a single node */
                self.tail = head?.next
            }
            self.head = head?.next
            
            return
        }
        
        var previousNode = head
        var count = 0
        
        //while count < index - 1, let nextNode = previousNode?.next {
        while count < index, let nextNode = previousNode?.next {
            if count == index - 1 {
                if nextNode.next == nil {
                    /* we're at the tail */
                    previousNode?.next = nil
                    self.tail = previousNode
                    return
                }
                
                /* we're removing `previousNode` */
                previousNode?.next = nextNode.next
                return
            }
            
            previousNode = nextNode
            count += 1
        }
        
        /* the given index isn't valid */
        throw LinkedListError.invalidIndex(index)
    }
}
