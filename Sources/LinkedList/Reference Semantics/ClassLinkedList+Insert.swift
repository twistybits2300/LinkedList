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
    
    public func insert(_ value: T, at index: Int) {
        let newNode = ListNode(value)
        
        if let head = self.head {
            if index <= 0 {
                /* insert at head */
                newNode.next = self.head
                self.head = newNode
            } else {
                var currentNode = head
                var count = 0
                
                while let nextNode = currentNode.next, count < index - 1 {
                    currentNode = nextNode
                    count += 1
                }
                
                newNode.next = currentNode.next
                currentNode.next = newNode
            }
        } else {
            /* list is empty */
            head = newNode
        }
    }
}
