import Foundation

// MARK: - Equatable
extension DoublyLinkedList: Equatable {
    public static func ==(left: DoublyLinkedList, right: DoublyLinkedList) -> Bool {
        left.head === right.head &&
        left.tail === right.tail
    }
}
