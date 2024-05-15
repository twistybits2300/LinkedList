import Foundation

extension ListNode {
    /// Returns the values in the list as an array.
    var asArray: [T] {
        var working = [T]()
        var current: ListNode<T>? = self
        
        while let currentNode = current {
            working.append(currentNode.value)
            current = current?.next
        }
        
        return working
    }
}
