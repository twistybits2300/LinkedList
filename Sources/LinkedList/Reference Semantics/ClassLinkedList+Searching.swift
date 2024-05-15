import Foundation

extension ClassLinkedList where T: Equatable {
    /// Determines if the given `value` is contained within the list.
    /// - Parameter value: The value to search for.
    /// - Returns: `true` if `value` is contained in the list; `false` otherwise.
    public func contains(_ value: T) -> Bool {
        find(value) != nil
    }
    
    public func find(_ value: T) -> ListNode<T>? {
        /*
        var current = head
        
        while let currentNode = current {
            
            current = currentNode.next
        }
        */
        
        var foundNode: ListNode<T>?
        
        func searcher(node: ListNode<T>) {
            if node.value == value {
                foundNode = node
            }
        }
        
        traverse(visit: searcher(node:))
        
        return foundNode
    }
}
