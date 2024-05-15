import Foundation

extension EnumListNode {
    /// Returns the first node in the list, staring with this node.
    var first: EnumListNode<T>? {
        self
    }
    
    /// Returns the last node in the list, starting with this node.
    var last: EnumListNode<T>? {
        var current: EnumListNode<T>? = self
        
        while let currentNode = current {
            if currentNode.next == nil {
                return currentNode
            }
            current = currentNode.next
        }
        
        return nil
    }
    
    /// Returns the node at the given `index`, starting from this node.
    /// - Parameter index: The index of the node desired.
    /// - Returns: The node at the given `index`.
    /// - Throws: `LinkedListError.invalidIndex(index)` if the given `index` is 
    /// not valid.
    public func node(at index: Int) throws -> EnumListNode<T> {
        var current: EnumListNode<T>? = self
        var count = 0

        while let currentNode = current {
            if count == index {
                return currentNode
            }
            count = count + 1
            current = currentNode.next
        }
        
        throw LinkedListError.invalidIndex(index)
    }
}
