import Foundation

extension EnumListNode {
    /// Removes the node at the given `index`.
    /// - Parameter index: The index of the node to be removed.
    /// - Throws: `LinkedListError.invalidIndex(index)` if the given `index` is not valid.
    public mutating func remove(at index: Int) throws {
        guard index >= 0 else {
            throw LinkedListError.invalidIndex(index)
        }
        
        var current: EnumListNode<T>? = self
        var previous: EnumListNode<T>? = nil
        var count = 0
        var list = EnumListNode(currentValue)
        
        while let currentNode = current {
            if count == index {
                //if let previousNode = previous {
                if previous != nil {
                    if currentNode.next == nil {
                        /* currentNode is the tail of the list */
                        self = list
                        return
                    } else {
                        list.append(contentsOf: currentNode.next)
                        self = list
                        return
                    }
                } else if let next = currentNode.next {
                    /* we're at the head of the list */
                    self = .value(next.currentValue, next: next.next)
                    return
                }
            }
            
            previous = currentNode
            current = currentNode.next
            count += 1
            
            if count > 1, let previousNode = previous {
                list.insert(previousNode.currentValue)
            }
        }
        
        /* if we made it to here it means the index was not valid */
        throw LinkedListError.invalidIndex(index)
    }
}
