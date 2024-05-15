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
    public func node(at index: Int) -> EnumListNode<T>? {
        var currentNode: EnumListNode<T>? = self
        var count = 0
        
        while count <= index, currentNode != nil {
            if count == index {
                return currentNode
            }
            count = count + 1
            currentNode = currentNode?.next
        }
        
        return nil
    }
```
