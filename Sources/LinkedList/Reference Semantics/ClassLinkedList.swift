import Foundation

/// A singly-linked list using reference semantics.
public final class ClassLinkedList<T> {
    /// Pointer to the first node in the list.
    public var head: ListNode<T>?
    
    /// Pointer to the last node in the list.
    public var tail: ListNode<T>?
    
    // MARK: - Initialization
    /// Initializes using the optional `head` node.
    /// - Parameter head: The list's first node.
    public init(head: ListNode<T>? = nil) {
        self.head = head
        self.tail = head
    }
}

/* 🚧 TODO: extract out into ClassLinkedList+Utility */
extension ClassLinkedList {
    var asArray: [T] {
        guard let head = head else {
            return []
        }
        
        return head.asArray
    }
    
    /*
    var tail: ListNode<T>? {
        guard let head = self.head else {
            return nil
        }
        
        var currentNode = head
        while let nextNode = currentNode.next {
            currentNode = nextNode
        }
        
        return currentNode
    }
    */
    
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

extension ClassLinkedList: Equatable where T: Equatable {
    public static func ==(left: ClassLinkedList, right: ClassLinkedList) -> Bool {
        guard let leftHead = left.head,
              let rightHead = right.head
        else {
            return false
        }
        
        return leftHead == rightHead
    }
}
