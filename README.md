# LinkedList

Reference and value semantics implementations of a linked list.

### Value semantics to do
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
    - [ ] `isEmpty() -> Bool`: Checks if the list is empty.

6. **Deletion**:
    - [ ] `remove(at index: Int)`: Removes the node at a specific index.
    - [ ] `remove(node: ListNode<T>)`: Removes a specified node from the list.
    - [ ] `removeLast()`: Removes the last node of the list.
    - [ ] `removeAll()`: Removes all nodes from the list.

7. **Searching**:
    - [ ] `contains(_ value: T)`: Checks whether the list contains a node with the specified value.
    - [ ] `find(_ value: T) -> ListNode<T>?`: Returns the node containing the specified value, if it exists.

8. **Reverse**:
    - [ ] `reverse()`: Reverses the order of the nodes in the list, particularly useful for singly linked lists.

```

### Reference semantics to do
```swift
1. **Initialization**:
    - [x] `init(_ value: T)`: Initializes a new node with the given value.
    - [x] `init(_ value: T, next: ListNode?)`: Optionally, initializes a new node with the given value and a reference to the next node.

2. **Insertion**:
    - [x] `insert(_ value: T)`: Inserts a new node at the end of the list.
    - [x] `insert(_ value: T, at index: Int)`: Inserts a new node at a specific index.
    - [ ] `insert(_ value: T, after: ListNode<T>)`: Inserts a new node after a specified node.
    - [ ] `insert(_ value: T, before: ListNode<T>)`: Inserts a new node before a specified node.

3. **Deletion**:
    - [ ] `remove(at index: Int)`: Removes the node at a specific index.
    - [ ] `remove(node: ListNode<T>)`: Removes a specified node from the list.
    - [ ] `removeLast()`: Removes the last node of the list.
    - [ ] `removeAll()`: Removes all nodes from the list.

4. **Traversal**:
    - [ ] `traverse()`: Visits each node of the list, often used for printing all values.
    - [ ] `reverseTraverse()`: Optionally, traverses the nodes in reverse order, useful in doubly linked lists.

5. **Searching**:
    - [ ] `contains(_ value: T)`: Checks whether the list contains a node with the specified value.
    - [ ] `find(_ value: T) -> ListNode<T>?`: Returns the node containing the specified value, if it exists.

6. **Access**:
    - [ ] `first() -> ListNode<T>?`: Returns the first node of the list.
    - [ ] `last() -> ListNode<T>?`: Returns the last node of the list.
    - [ ] `node(at index: Int) -> ListNode<T>?`: Returns the node at a specific index.

7. **Utility**:
    - [ ] `count() -> Int`: Returns the number of nodes in the list.
    - [ ] `isEmpty() -> Bool`: Checks if the list is empty.

8. **Reverse**:
    - [ ] `reverse()`: Reverses the order of the nodes in the list, particularly useful for singly linked lists.

9. **Copy**:
    - [ ] `copy() -> ListNode<T>`: Creates a copy of the list, ensuring modifications on the copy do not affect the original list, relevant for linked lists implemented with reference semantics (like in classes).

```
