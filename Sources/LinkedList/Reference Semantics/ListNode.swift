import Foundation

/// A node in a singly-linked list that uses reference semantics.
public final class ListNode<T> {
    /// THe node's value.
    public var value: T
    
    /// The pointer to the next node in the list.
    public var next: ListNode<T>?
    
    // MARK: - Initialization
    /// Initializes using the provided `value` and optional `next` node.
    /// - Parameters:
    ///   - value: The node's value.
    ///   - next: The optional pointer to the next node. Defaults to `nil`.
    public init(_ value: T, next: ListNode<T>? = nil) {
        self.value = value
        self.next = next
    }
}

extension ListNode: Equatable where T: Equatable {
    public static func ==(left: ListNode, right: ListNode) -> Bool {
        return left.value == right.value
        && left.next == right.next
    }
}
