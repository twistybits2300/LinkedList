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
}
