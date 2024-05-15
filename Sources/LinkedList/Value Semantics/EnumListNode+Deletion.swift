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

extension EnumListNode where T : Equatable {
    /// Removes the given `node` from this list.
    /// - Parameter node: The node to be removed.
    /// - Throws: `LinkedListError.unableToRemoveNode` when attempting to remove
    /// the head node in a single-node list.
    public mutating func remove(node: EnumListNode<T>) throws {
        var current: EnumListNode<T>? = self
        var list = EnumListNode(currentValue)
        
        while let currentNode = current {
            if self == node {
                /* remove the head of the list */
                if let nextNode = currentNode.next {
                    self = nextNode
                    return
                } else {
                    throw LinkedListError.unableToRemoveNode
                }
            } else if currentNode.next == node {
                print("         list: \(list.asArray)")
                print("     removing: \(node.currentValue)")
                if currentNode.next?.next == nil {
                    /* we're at the tail of the list */
                    self = list
                    return
                } else {
                    /* we're between the head & tail of the list */
                    list.append(contentsOf: currentNode.next?.next)
                    self = list
                    return
                }
            }
            
            current = currentNode.next
            
            if let value = current?.currentValue {
                list.insert(value)
            }
        }
        
        throw LinkedListError.unknownNode
    }
}
