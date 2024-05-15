import Foundation

extension ClassLinkedList where T: Equatable {
    /// Determines if the given `value` is contained within the list.
    /// - Parameter value: The value to search for.
    /// - Returns: `true` if `value` is contained in the list; `false` otherwise.
    public func contains(_ value: T) -> Bool {
        find(value) != nil
    }
    
    /// Searches the list for the given `value`
    /// - Parameter value: The value to search for.
    /// - Returns: The first node from `head` that contains `value`; `nil` if not found.
    public func find(_ value: T) -> ListNode<T>? {
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
