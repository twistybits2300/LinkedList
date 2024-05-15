import Foundation

/// A doubly-linked list.
public class DoublyLinkedList<T: Equatable> {
    /// Points to the first element in the list.
    public private(set) var head: DoublyLinkedNode<T>?

    /// Points to the last element in the list.
    public private(set) var tail: DoublyLinkedNode<T>?

    // MARK: - Initialization
    /// Initializes an empty list.
    public init() {
        /* no-op */
    }

    /// Initializes with the provided `head` and `tail` nodes.
    /// - Parameters:
    ///   - head: Optional: the first element in the list; defaults to `nil`.
    ///   - tail: Optional: the last element in the list; defaults to `nil`.
    internal init(head: DoublyLinkedNode<T>? = nil,
                  tail: DoublyLinkedNode<T>? = nil) {
        self.head = head
        self.tail = tail
    }

    // MARK: - API
    /// Returns `true` if there are no elements in this list; `false` otherwise.
    public var isEmpty: Bool {
        head == nil
    }

    /// Returns the first element in the list; may be `nil`.
    public var first: DoublyLinkedNode<T>? {
        head
    }

    /// Returns the last element in the list; may be `nil`.
    public var last: DoublyLinkedNode<T>? {
        tail
    }

    /// Adds the given `value` to the front of the list.
    /// - Parameter value: The value to be prepended.
    public func prepend(_ value: T) {
        let newNode = DoublyLinkedNode(value: value)

        guard let headNode = head else {
            head = newNode
            tail = newNode
            return
        }

        newNode.next = headNode
        headNode.previous = newNode
        head = newNode
    }

    /// Appends the given `value` to the back of the list.
    /// - Parameter value: The value to be appended.
    public func append(_ value: T) {
        let newNode = DoublyLinkedNode(value: value)

        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return
        }

        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }

    /// Removes the given `node` from the list.
    /// - Parameter node: The node to be removed.
    /// - Returns: The value of the removed node.
    ///
    /// If the list is empty, or if the given node is not contained in the list
    /// the value of the given node is returned and the list is not altered.
    @discardableResult
    public func remove(_ node: DoublyLinkedNode<T>) -> T {
        guard !isEmpty else {
            return node.value
        }

        guard contains(node: node) else {
            return node.value
        }

        let previous = node.previous
        let next = node.next

        if let previousNode = previous {
            previousNode.next = next
        } else {
            head = next
        }

        if next == nil {
            tail = previous
        }

        node.previous = nil
        node.next = nil

        return node.value
    }

    /// For determining if the given `node` is contained in the list.
    /// - Parameter node: The node to be searched.
    /// - Returns: `true` if the node is on the list; `false` otherwise.
    public func contains(node: DoublyLinkedNode<T>) -> Bool {
        var currentNode = head

        while currentNode != nil {
            if let currentValue = currentNode?.value, currentValue == node.value {
                return true
            }

            currentNode = currentNode?.next
        }

        return false
    }
    
    /// Traverses all nodes in the list starting at `head` and continuing until `tail`,
    /// calling the `visitor` closure upon visiting each node.
    /// - Parameter visitor: The closure to be called.
    public func traverse(visit visitor: (DoublyLinkedNode<T>) -> Void) {
        for node in self {
            visitor(node)
        }
    }
}
