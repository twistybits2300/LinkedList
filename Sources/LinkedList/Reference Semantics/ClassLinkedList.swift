import Foundation

/// A singly-linked list using reference semantics.
public final class ClassLinkedList<T> {
    /// Pointer to the first node in the list.
    public var head: ListNode<T>?
    
    /// Pointer to the last node in the list.
    public var tail: ListNode<T>?
    
    // MARK: - Initialization
    /// Initializes using the optional `head` node.
    /// - Parameter head: The list's first node.
    public init(head: ListNode<T>? = nil) {
        self.head = head
        self.tail = head
    }
}
