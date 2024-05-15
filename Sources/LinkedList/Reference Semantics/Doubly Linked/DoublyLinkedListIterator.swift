import Foundation

/// Iterator for a doubly-linked list.
public class DoublyLinkedListIterator<T: Equatable>: IteratorProtocol {
    private var current: DoublyLinkedNode<T>?

    // MARK: - Initialization
    public init(node: DoublyLinkedNode<T>?) {
        current = node
    }

    // MARK: - IteratorProtocol
    public func next() -> DoublyLinkedNode<T>? {
        defer { current = current?.next }
        return current
    }
}

// MARK: - Sequence
extension DoublyLinkedList: Sequence {
    public func makeIterator() -> DoublyLinkedListIterator<T> {
        DoublyLinkedListIterator(node: head)
    }
}
