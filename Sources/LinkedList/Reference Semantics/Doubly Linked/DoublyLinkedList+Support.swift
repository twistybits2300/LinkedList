import Foundation
//@testable import LinkedList

/// Traverses the provided `list` from `head` to `tail` producing an array of the elements.
/// - Parameter list: The list to be converted into an array
/// - Returns: An array of the elements in order from `head` to `tail`.
public func toArrayForward<T: Equatable>(list: DoublyLinkedList<T>) -> [T] {
    Array(list).map { $0.value }
}

/// Traverses the provided `list` from `tail` to `head` producing an array of the elements.
/// - Parameter list: The list to be converted into an array
/// - Returns: An array of the elements in order from `tail` to `head`.
public func toArrayBackward<T: Equatable>(list: DoublyLinkedList<T>) -> [T] {
    var array = [T]()
    var currentNode: DoublyLinkedNode<T>? = list.tail

    while currentNode != nil {
        if let previousValue = currentNode?.value {
            array.append(previousValue)
        }
        currentNode = currentNode?.previous
    }

    return array
}

extension Array where Element : Equatable {
    /// Converts this array into a doubly-linked list.
    /// - Returns: A doubly-linked list containing the elements of this array.
    public func toDoublyLinkedList() -> DoublyLinkedList<Element> {
        let list = DoublyLinkedList<Element>()

        for value in self {
            list.append(value)
        }

        return list
    }
}
