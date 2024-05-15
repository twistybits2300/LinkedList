import Foundation

extension ListNode {
    /// Appends the given `value` at the end of the list.
    /// - Parameter value: The new node's value.
    public func append(_ value: T) {
        var currentNode: ListNode<T> = self
        
        while let nextNode = currentNode.next {
            currentNode = nextNode
        }
        
        currentNode.next = .init(value)
    }
}
