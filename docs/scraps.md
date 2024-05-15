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
```

```swift
/* incorrect */
public mutating func insert(_ value: T, at index: Int) throws {
    if index == 0 {
        self = .value(value, next: self)
    } else {
        var currentIndex = 0
        var currentNode = self
        var previousNode: EnumListNode<T>?
        
        while currentIndex < index {
            if let nextNode = currentNode.next {
                previousNode = currentNode
                currentNode = nextNode
                currentIndex += 1
            } else {
                /* we're at the end of the list before reaching
                 the index, which is an error */
                throw LinkedListError.invalidIndex(index)
            }
        }
        
        let newNode = EnumListNode(value, next: currentNode)
        if let previous = previousNode {
            previous.next = newNode
            /* */
        }
    }
}
```
