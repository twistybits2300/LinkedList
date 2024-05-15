import Foundation

extension ClassLinkedList {
    /// Visits each node in the list, calling the`visitor` closure at each node.
    /// - Parameter visitor: The closure to be called when visiting each node in the list.
    public func traverse(visit visitor: (ListNode<T>) -> Void) {
        var current = head
        
        while let currentNode = current {
            visitor(currentNode)
            current = currentNode.next
        }
    }
    
    var asArray: [T] {
        guard let head = head else {
            return []
        }
        
        return head.asArray
    }
    
    func node(at index: Int) -> ListNode<T>? {
        guard let head = head else {
            return nil
        }
        
        var currentNode = head
        var count = 0
        
        while let nextNode = currentNode.next, count < index {
            currentNode = nextNode
            count += 1
        }
        
        return currentNode
    }
}
