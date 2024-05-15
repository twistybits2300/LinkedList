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

    /// Inserts the given `value` into the list at the given `index`.
    /// - Parameters:
    ///   - value: The value to be inserted.
    ///   - index: The index of where to insert.
    public func insert(_ value: T, at index: Int) {
        let newNode = ListNode(value)

        if index <= 0 {
            
            /*
            print("self: \(self.value) | self.next: \(String(describing: self.next?.value))")
            print("\(self.asArray)")
            
            let currentNext = self.next
            newNode.next = self
            self.next = currentNext

            print("self: \(self.value) | self.next: \(String(describing: self.next?.value))")
            print("\(self.asArray)")
            */
        } else {
            var currentNode = self
            var count = 0
            
            while let nextNode = currentNode.next, count < index - 1 {
                currentNode = nextNode
                count += 1
            }

            newNode.next = currentNode.next
            currentNode.next = newNode
        }
    }
    
    func insert2(_ value: T, at index: Int) {
            if index <= 0 {
                let newNode = ListNode(value)
                newNode.next = self.next
                self.next = newNode
            } else {
                var currentNode = self
                var currentIndex = 0
                while let nextNode = currentNode.next, currentIndex < index - 1 {
                    currentNode = nextNode
                    currentIndex += 1
                }
                let newNode = ListNode(value)
                newNode.next = currentNode.next
                currentNode.next = newNode
            }
        }
    
    /// Validates that `insert(_:at:)` can successfully insert a node at the head of the list.
    func test_insertAt_head() throws {
        let expectedValue = fixture.randomNumber
        print("expectedValue: \(expectedValue)")
        let numbers = fixture.randomNumbers()
        print("      numbers: \(numbers)")
        let sut = fixture.makeListNodeSUT(numbers: numbers)
        
        let index = 0
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: index)
        print("expectedArray: \(expectedArray)")
        sut.insert(expectedValue, at: index)
        print("  sut.asArray: \(sut.asArray)")
        //XCTAssertEqual(sut.asArray, expectedArray)
    }
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
