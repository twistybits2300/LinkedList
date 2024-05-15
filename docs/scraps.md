```swift
```

```swift
```

```swift
```

```swift
```

```swift
```

```swift
```

```swift
```

```swift
```

```swift
```

```swift
                        /* currentNode is the tail of the list */
                        /*
                        print(" | p: \(previousNode.currentValue)", terminator: "")
                        print(" | c: \(currentNode.currentValue)", terminator: "")
                        //print(" | n: \(String(describing: currentNode.next?.currentValue))", terminator: "")
//                        var previousNext = previous?.next
//                        previousNext?.setNext(nil)
                        print()
                        print("self: \(String(describing: self))")
                        print("prev: \(String(describing: previous))")
                        previous?.setNext(nil)
                        print("prev: \(String(describing: previous))")
                        print("self: \(String(describing: self))")
                        */
                        //previous?.setNext(nil)
                        //print()
```

```swift

/*
extension EnumListNode {
    /// Removes the node at the specified index in the list.
    /// - Parameter index: The index of the node to remove.
    mutating func remove(at index: Int) {
        guard index >= 0 else { return }
        
        if index == 0 {
            // Special case: Removing the head node
            self = self.next ?? .value(self.currentValue, next: nil)
            return
        }
        
        var currentIndex = 0
        var current: EnumListNode<T>? = self
        var previous: EnumListNode<T>? = nil
        
        while let currentNode = current {
            if currentIndex == index {
                // Remove the current node by reconstructing the list
                previous?.setNext(currentNode.next)
                return
            }
            
            previous = current
            current = currentNode.next
            currentIndex += 1
        }
    }
    
    /// Helper method to set the next node.
    private mutating func setNext(_ next: EnumListNode<T>?) {
        switch self {
        case .value(let value, _):
            self = .value(value, next: next)
        }
    }
}
*/
/*
extension EnumListNode {
    /// Removes the node at the specified index in the list.
    /// - Parameter index: The index of the node to remove.
    mutating func remove(at index: Int) {
        guard index >= 0 else { return }

        if index == 0 {
            // Special case: Removing the head node
            self = self.next ?? .value(self.currentValue, next: nil)
            return
        }

        var currentIndex = 0
        var current: EnumListNode<T>? = self
        var previous: EnumListNode<T>? = nil

        while let currentNode = current {
            if currentIndex == index {
                // Remove the current node by reconstructing the list
                previous?.setNext(currentNode.next)
                return
            }

            previous = currentNode
            current = currentNode.next
            currentIndex += 1
        }
    }

    /// Helper method to set the next node.
    private mutating func setNext(_ next: EnumListNode<T>?) {
        switch self {
        case .value(let value, _):
            self = .value(value, next: next)
        }
    }
}
*/

```
