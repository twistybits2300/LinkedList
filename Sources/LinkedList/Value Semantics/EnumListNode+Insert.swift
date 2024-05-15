import Foundation

extension EnumListNode {
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
    ///  - Throws: `LinkedListError.invalidIndex(index)` if the end of the list 
    ///  is reached before the given `index`.
    public mutating func insert(_ value: T, at index: Int) throws {
        self = try self.inserting(value, at: index)
    }
    
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

extension EnumListNode where T: Equatable {
    /// Inserts the given `value` after the provided `afterNode`. `T` must be `Equatable`.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - afterNode: The node after which the value will be inserted.
    /// - Throws: `LinkedListError.unknownNode` if the provided `afterNode` is not
    /// in the list.
    public mutating func insert(_ value: T, after afterNode: EnumListNode<T>) throws {
        self = try self.inserting(value, after: afterNode)
    }
    
    private func inserting(_ value: T, after afterNode: EnumListNode<T>) throws -> EnumListNode<T> {
        if self == afterNode {
            return .init(currentValue, next: .value(value, next: self.next))
        } else if let next = self.next {
            let nextNode = try next.inserting(value, after: afterNode)
            return .init(currentValue, next: nextNode)
        } else {
            throw LinkedListError.unknownNode
        }
    }
    
    /// Inserts the given `value` into the list before the provided `beforeNode`. `T` must be
    /// `Equatable`
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - beforeNode: The node where the value will be inserted before.
    public mutating func insert(_ value: T, before beforeNode: EnumListNode<T>) throws {
        self = try self.inserting(value, before: beforeNode)
    }
    
    private func inserting(_ value: T, before beforeNode: EnumListNode<T>) throws -> EnumListNode<T> {
        if self.next == beforeNode {
            return .init(value, next: .value(currentValue, next: self.next))
        } else if let next = self.next {
            let nextNode = try next.inserting(value, before: beforeNode)
            return .init(currentValue, next: nextNode)
        } else {
            throw LinkedListError.unknownNode
        }
    }
}
