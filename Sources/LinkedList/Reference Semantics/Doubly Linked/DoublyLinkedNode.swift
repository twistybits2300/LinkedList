import Foundation

/// Represents a node in a doubly-linked list.
public class DoublyLinkedNode<T: Equatable> {
    /// The node's value.
    public private(set) var value: T

    /// Pointer to the next element in the list.
    public internal(set) var next: DoublyLinkedNode<T>?

    /// Pointer to the previous element in the list.
    public internal(set) var previous: DoublyLinkedNode<T>?

    // MARK: - Initialization
    /// Initializes using the provided `value`.
    /// - Parameter value: This node's value.
    public init(value: T) {
        self.value = value
    }

    /// Initializes using the provided parameters.
    /// - Parameters:
    ///   - value: This node's value.
    ///   - next: Optional: the next node to this node in the list.
    ///   - previous: Optional: the previous node to this one in the list.
    internal init(value: T,
                  next: DoublyLinkedNode<T>? = nil,
                  previous: DoublyLinkedNode<T>? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}

// MARK: - Equatable
extension DoublyLinkedNode: Equatable {
    public static func ==(left: DoublyLinkedNode, right: DoublyLinkedNode) -> Bool {
        left.value == right.value &&
        left.next === right.next &&
        left.previous === right.previous
    }
}
