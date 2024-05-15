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
    func test_insertBefore_middle() throws {
        let expectedValue = fixture.randomNumber
        print("expectedValue: \(expectedValue)")

        let numbers = fixture.randomNumbers()
        print("      numbers: \(numbers)")

        let index = numbers.count / 2
        print("   numbers[\(index)]: \(numbers[index])")
        
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: index)
        print("expectedArray: \(expectedArray)")
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let middle = try XCTUnwrap(sut.node(at: index))

        try sut.insert(expectedValue, before: middle)
        print("  sut.asArray: \(sut.asArray)")

        XCTAssertEqual(sut.asArray, expectedArray)
    }
```

```swift
        /*
        var currentNode = head
        var count = 0
        
        while let nextNode = currentNode.next, count < index {
            currentNode = nextNode
            count += 1
        }
        
        return currentNode
        */
```

```swift
class ListNode<T> {
    var value: T
    var next: ListNode?
    
    init(_ value: T) {
        self.value = value
        self.next = nil
    }
}

class LinkedList<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ value: T) {
        let newNode = ListNode(value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func removeFirst() -> T? {
        guard let currentHead = head else { return nil }
        
        let value = currentHead.value
        head = currentHead.next
        if head == nil {
            tail = nil
        }
        return value
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func printList() {
        var currentNode = head
        while let node = currentNode {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
}

// Example usage:
let list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.append(4)

print("Initial list:")
list.printList()

list.removeFirst()
print("List after removing first element:")
list.printList()

list.removeAll()
print("List after removing all elements:")
list.printList()
```
