import Foundation

extension EnumListNode {
    /// Returns the number of items in the list.
    public var count: Int {
        var count = 0
        self.traverse { _ in
            count += 1
        }
        return count
    }
    
    /// Appends the nodes from the provided `list` to this list.
    /// - Parameter list: The list from which to append the nodes.
    mutating func append(contentsOf list: EnumListNode?) {
        guard let list = list else { return }
        
        var current: Self? = list
        
        while let currentNode = current {
            insert(currentNode.currentValue)
            current = current?.next
        }
    }
    
    /// Returns the values of the nodes in this list as an array.
    var asArray: [T] {
        var working = [T]()
        var currentNode: EnumListNode? = self
        
        while currentNode != nil {
            if let value = currentNode?.currentValue {
                working.append(value)
            }
            currentNode = currentNode?.next
        }
        
        return working
    }
    
    /// Reverses the list.
    mutating func reverse() {
        var previous: EnumListNode<T>? = nil
        var current: EnumListNode? = self
        
        while let currentNode = current {
            let nextNode = currentNode.next
            current = .value(currentNode.currentValue, next: previous)
            previous = current
            current = nextNode
        }
        
        self = previous ?? self // In case the list was empty, don't change it
    }
}
