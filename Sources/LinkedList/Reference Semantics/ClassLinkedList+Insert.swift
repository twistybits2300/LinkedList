import Foundation

extension ClassLinkedList {
    /// Appends the given `value` at the end of the list.
    /// - Parameter value: The new node's value.
    public func append(_ value: T) {
        if let head = self.head {
            var currentNode: ListNode<T> = head
            
            while let nextNode = currentNode.next {
                currentNode = nextNode
            }
            
            currentNode.next = ListNode(value)
        } else {
            /* empty list */
            let node = ListNode(value)
            self.head = node
        }
    }
}
