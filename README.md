# LinkedList

Reference and value semantics implementations of a linked list.

### Reference semantics features
```swift
1. **Initialization**:
    - [x] `init(_ value: T)`: Initializes a new node with the given value.
    - [x] `init(_ value: T, next: ListNode?)`: Optionally, initializes a new node with the given value and a reference to the next node.

2. **Insertion**:
    - [x] `append(_ value: T)`: Inserts a new node at the end of the list.
    - [x] `insert(_ value: T, at index: Int)`: Inserts a new node at a specific index.
    - [x] `insert(_ value: T, after: ListNode<T>)`: Inserts a new node after a specified node.
    - [x] `insert(_ value: T, before: ListNode<T>)`: Inserts a new node before a specified node.

3. **Deletion**:
    - [x] `remove(at index: Int)`: Removes the node at a specific index.
    - [x] `remove(node: ListNode<T>)`: Removes a specified node from the list.
    - [x] `removeFirst()`: Removes the first node of the list.
    - [x] `removeLast()`: Removes the last node of the list.
    - save this for when `traverse()` is available
    - [x] `removeAll()`: Removes all nodes from the list.

4. **Traversal**:
    - [x] `traverse()`: Visits each node of the list, often used for printing all values.

5. **Searching**:
    - [x] `contains(_ value: T)`: Checks whether the list contains a node with the specified value.
    - [x] `find(_ value: T) -> ListNode<T>?`: Returns the node containing the specified value, if it exists.

6. **Access**:
    - [x] `node(at index: Int) -> ListNode<T>?`: Returns the node at a specific index.

7. **Utility**:
    - [x] `count() -> Int`: Returns the number of nodes in the list.
    - [x] `isEmpty() -> Bool`: Checks if the list is empty.

8. **Reverse**:
    - [x] `reverse()`: Reverses the order of the nodes in the list, particularly useful for singly linked lists.

9. **Copy**:
    - [ ] `copy() -> ListNode<T>`: Creates a copy of the list, ensuring modifications on the copy do not affect the original list, relevant for linked lists implemented with reference semantics (like in classes).
```

#### Doubly-linked list
```swift
1. **Initialization**
    - [x] `init()`
    - [x] `init(head:tail:)`

2. **Utility**
    - [x] `isEmpty: Bool`
    - [x] `first: T?`
    - [x] `last: T?`
    - [x] `contains(node: DoublyLinkedNode<T>) -> Bool`

3. **Insertion**:
    - [x] `prepend(_: T)`: adds the value to the front of the list
    - [x] `append(_: T)`: adds the value to the back of the list

4. **Deletion**:
    - [x] `remove(_:DoublyLinkedNode<T>) -> T?`

5. **Sequence**:
    - [x] `DoublyLinkedListIterator<T>`
    - [x] `makeIterator() -> DoublyLinkedListIterator<T>`
```

### Value semantics features
```swift
1. **Initialization**:
    - [x] `init(_ value: T)`: Initializes a new node with the given value.
    - [x] `init(_ value: T, next: ListNode?)`: Optionally, initializes a new node with the given value and a reference to the next node.

2. **Insertion**:
    - [x] `insert(_ value: T)`: Inserts a new node at the end of the list.
    - [x] `insert(_ value: T, at index: Int)`: Inserts a new node at a specific index.
    - [x] `insert(_ value: T, after: ListNode<T>)`: Inserts a new node after a specified node.
    - [x] `insert(_ value: T, before: ListNode<T>)`: Inserts a new node before a specified node.

3. **Traversal**:
    - [x] `traverse()`: Visits each node of the list, often used for printing all values.

4. **Access**:
    - [x] `first() -> ListNode<T>?`: Returns the first node of the list.
    - [x] `last() -> ListNode<T>?`: Returns the last node of the list.
    - [x] `node(at index: Int) -> ListNode<T>?`: Returns the node at a specific index.

5. **Utility**:
    - [x] `count() -> Int`: Returns the number of nodes in the list.

6. **Deletion**:
    - [x] `remove(at index: Int)`: Removes the node at a specific index.
    - [x] `remove(node: ListNode<T>)`: Removes a specified node from the list.
    - [x] `removeLast()`: Removes the last node of the list.
    - [x] `removeAll()`: Removes all nodes from the list.

7. **Searching**:
    - [x] `contains(_ value: T)`: Checks whether the list contains a node with the specified value.
    - [x] `find(_ value: T) -> ListNode<T>?`: Returns the node containing the specified value, if it exists.

8. **Reverse**:
    - [x] `reverse()`: Reverses the order of the nodes in the list, particularly useful for singly linked lists.

```
