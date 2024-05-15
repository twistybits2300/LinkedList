import Foundation

/// Indicates errors encountered while working with a linked list.
///
/// - `invalidIndex(index: Int)`: An invalid index was given.
/// - `unknownEnumListNode`: An unknown `EnumListNode` was given.
/// - `unableToRemoveNode`: Attempt to remove a node failed.
public enum LinkedListError: Error {
    case invalidIndex(Int)
    case unknownNode
    case unableToRemoveNode
    case emptyList
}
