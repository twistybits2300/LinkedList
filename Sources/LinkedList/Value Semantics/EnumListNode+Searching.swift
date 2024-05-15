import Foundation

extension EnumListNode where T: Equatable {
    /// Searches through the list to find the given `value`.
    /// - Parameter value: The value to be found
    /// - Returns: The node containing the `value`; `nil` if not found.
    public func find(_ value: T) -> EnumListNode<T>? {
        var current: EnumListNode<T>? = self
        
        while let currentNode = current {
            if currentNode.currentValue == value {
                return currentNode
            }
            
            current = current?.next
        }
        
        return nil
    }
    
    /// Returns `true` if the list contains the given `value`
    /// - Parameter value: The value to be checked.
    /// - Returns: `true` if `value` is found within the list; `false` otherwise.
    public func contains(_ value: T) -> Bool {
        find(value) != nil
    }
}
