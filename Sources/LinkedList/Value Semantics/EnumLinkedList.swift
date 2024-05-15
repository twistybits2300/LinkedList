import Foundation

/// A value semantics implementation of a linked list.
///
/// It has two states (cases):
/// - `headNode`: the first node in the list.
/// - `empty`: indicates the list contains no nodes.
public enum EnumLinkedList<T> {
    case headNode(EnumListNode<T>)
    case empty
    
    // MARK: - Initialization
    /// Initializes using the provided `value`
    /// - Parameter value: The value to be set at the first node in the list.
    public init(value: T) {
        self = .headNode(.value(value, next: nil))
    }
    
    /// Initializes using the provided `node`.
    /// - Parameter node: The node to be set as the first node in the list.
    public init(node: EnumListNode<T>) {
        self = .headNode(node)
    }
    
    // MARK: - API
    /// Returns the first node in the list.
    public var head: EnumListNode<T>? {
        switch self {
        case .empty:
            return nil
        case .headNode(let headNode):
            return headNode
        }
    }
    
    /// Returns the last node in the list.
    public var tail: EnumListNode<T>? {
        switch self {
        case .headNode(let headNode):
            return headNode.last
        case .empty:
            return nil
        }
    }
    
    /// Returns the number of items in the list.
    public var count: Int {
        switch self {
        case .headNode(let headNode):
            return headNode.count
        case .empty:
            return 0
        }
    }
    
    /// Returns `true` if tnere are no nodes in this list, `false` otherwise.
    public var isEmpty: Bool {
        switch self {
        case .headNode:
            return false
        case .empty:
            return true
        }
    }
    
    /// Returns the node at the given `index`, starting from the list head.
    /// - Parameter index: The index of the node desired.
    /// - Returns: The node at the given `index`.
    /// - Throws: `LinkedListError.invalidIndex(index)` if the given `index` is 
    /// not valid.
    public func node(at index: Int) throws -> EnumListNode<T>? {
        switch self {
        case .headNode(let enumListNode):
            return try enumListNode.node(at: index)
        case .empty:
            return nil
        }
    }
    
    /// Inserts the given `value` at the end of the list.
    /// - Parameter value: The value to be inserted.
    public mutating func insert(_ value: T) {
        switch self {
        case .headNode(var headNode):
            headNode.insert(value)
            self = .headNode(headNode)
        case .empty:
            self = .headNode(EnumListNode(value))
        }
    }
    
    /// Inserts the given `value` into the list at the given `index.`
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - index: The index of where to insert the value.
    ///  - Throws: `LinkedListError.invalidIndex(index)` if the end of the list 
    ///  is reached before the given `index`.
    public mutating func insert(_ value: T, at index: Int) throws {
        switch self {
        case .headNode(var headNode):
            try headNode.insert(value, at: index)
            self = .headNode(headNode)
        case .empty:
            self = .headNode(EnumListNode(value))
        }
    }
    
    /// Removes the node at the given `index`.
    /// - Parameter index: The index of the node to be removed.
    /// - Throws: `LinkedListError.invalidIndex(index)` if the given `index` is not valid.
    public mutating func remove(at index: Int) throws {
        switch self {
        case .headNode(var headNode):
            try headNode.remove(at: index)
            self = .headNode(headNode)
        case .empty:
            break
        }
    }
    
    /// Remove the first node from the list.
    public mutating func removeFirst() {
        switch self {
        case .headNode(let headNode):
            if let nextNode = headNode.next {
                self = .headNode(nextNode)
            } else {
                self = .empty
            }
        case .empty:
            break
        }
    }
    
    /// Remove the last node from the list.
    /// - Throws: When attempting to remove a list with only one node.
    public mutating func removeLast() throws {
        switch self {
        case .headNode(var headNode):
            if headNode.next != nil {
                try headNode.removeLast()
                self = .headNode(headNode)
            } else {
                self = .empty
            }
        case .empty:
            break
        }
    }
    
    /// Removes all of the nodes from the list.
    public mutating func removeAll() {
        self = .empty
    }
}

extension EnumLinkedList where T: Equatable {
    /// Searches through the list to find the given `value`.
    /// - Parameter value: The value to be found
    /// - Returns: The node containing the `value`; `nil` if not found.
    public func find(_ value: T) -> EnumListNode<T>? {
        switch self {
        case .headNode(let enumListNode):
            return enumListNode.find(value)
        case .empty:
            return nil
        }
    }
    
    /// Returns `true` if the list contains the given `value`
    /// - Parameter value: The value to be checked.
    /// - Returns: `true` if `value` is found within the list; `false` otherwise.
    public func contains(_ value: T) -> Bool {
        switch self {
        case .headNode(let enumListNode):
            return enumListNode.contains(value)
        case .empty:
            return false
        }
    }

    /// Inserts the given `value` after the provided `afterNode`. `T` must be `Equatable`.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - afterNode: The node after which the value will be inserted.
    /// - Throws: `LinkedListError.unknownNode` if the provided `afterNode` is not
    /// in the list.
    public mutating func insert(_ value: T, after node: EnumListNode<T>) throws {
        switch self {
        case .headNode(var headNode):
            try headNode.insert(value, after: node)
            self = .headNode(headNode)
        case .empty:
            self = .headNode(EnumListNode(value))
        }
    }

    /// Inserts the given `value` into the list before the provided `beforeNode`. `T` must be
    /// `Equatable`
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - beforeNode: The node where the value will be inserted before.
    public mutating func insert(_ value: T, before node: EnumListNode<T>) throws {
        switch self {
        case .headNode(var headNode):
            try headNode.insert(value, before: node)
            self = .headNode(headNode)
        case .empty:
            self = .headNode(EnumListNode(value))
        }
    }

    /// Removes the given `node` from this list.
    /// - Parameter node: The node to be removed.
    /// - Throws: `LinkedListError.unableToRemoveNode` when attempting to remove
    /// the head node in a single-node list.
    public mutating func remove(node: EnumListNode<T>) throws {
        switch self {
        case .headNode(var headNode):
            if headNode.next != nil {
                try headNode.remove(node: node)
                self = .headNode(headNode)
            } else {
                self = .empty
            }
        case .empty:
            break
        }
    }
}
