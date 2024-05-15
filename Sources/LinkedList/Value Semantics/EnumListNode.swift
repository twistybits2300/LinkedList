import Foundation

/// A value semantics implementation of a linked list node.
public indirect enum EnumListNode<T> {
    case value(T, next: EnumListNode<T>?)
    
    // MARK: - Initialization
    /// Initializes with the provided `value`. Sets `next` to `nil`.
    /// - Parameter value: This node's value.
    public init(_ value: T) {
        self = .value(value, next: nil)
    }
    
    /// Initializes using the provided `value` and optional `next` node.
    /// - Parameters:
    ///   - value: The node's value.
    ///   - next: The node's optional pointer to the next node.
    public init(_ value: T, next: EnumListNode<T>? = nil) {
        self = .value(value, next: next)
    }
    
    // MARK: - API
    /// This node's current value.
    public var currentValue: T {
        switch self {
        case .value(let t, _):
            return t
        }
    }
    
    /// This node's pointer to the `next` node.
    public var next: EnumListNode<T>? {
        switch self {
        case .value(_, let next):
            return next
        }
    }
    
    /// Inserts the given `value` at the end of the list.
    /// - Parameter value: The value to be inserted.
    public mutating func insert(_ value: T) {
        if var nextNode = self.next {
            nextNode.insert(value)
            self = .value(currentValue, next: nextNode)
        } else {
            self = .value(currentValue, next: .value(value, next: nil))
        }
    }
    
    /// Inserts the given `value` into the list at the given `index.`
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - index: The index of where to insert the value.
    ///  - Throws: `LinkedListError.invalidIndex(index)` if the end of the list is reached
    ///  before the given `index`.
    public mutating func insert(_ value: T, at index: Int) throws {
        self = try self.inserting(value, at: index)
    }
    
    // MARK: - Utilities
    private func inserting(_ value: T, at index: Int) throws -> Self {
        let next = self.next
        if index == 0 {
            /* insert before the current node */
            return .init(value, next: self)
        } else if let nextNode = next {
            /* recursively call insert if on the next node if index is not 0 */
            let newNext = try nextNode.inserting(value, at: index - 1)
            return .init(currentValue, next: newNext)
        } else {
            /* we're at the end of the list before reaching the index, throw an error */
            throw LinkedListError.invalidIndex(index)
        }
    }
}
