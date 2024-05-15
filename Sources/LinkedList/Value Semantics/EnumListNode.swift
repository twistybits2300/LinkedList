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
}
