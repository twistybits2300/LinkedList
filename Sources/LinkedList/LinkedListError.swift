import Foundation

/// Indicates errors encountered while working with a linked list.
///
/// - `invalidIndex(index: Int)`: An invalid index was given.
/// - `unknownEnumListNode`: An unknown `EnumListNode` was given.
public enum LinkedListError: Error {
    case invalidIndex(Int)
    case unknownNode
}
