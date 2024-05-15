import Foundation

/// A node in a singly-linked list that uses reference semantics.
public final class ListNode<T> {
    /// THe node's value.
    public private(set) var value: T
    
    /// The pointer to the next node in the list.
    public private(set) var next: ListNode<T>?
    
    // MARK: - Initialization
    /// Initializes using the provided `value` and optional `next` node.
    /// - Parameters:
    ///   - value: The node's value.
    ///   - next: The optional pointer to the next node. Defaults to `nil`.
    public init(value: T, next: ListNode<T>? = nil) {
        self.value = value
        self.next = next
    }
}