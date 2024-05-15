import XCTest
import os
@testable import LinkedList

/// Validation of `EnumLinkedList`.
final class EnumLinkedListTests: XCTestCase {
    private typealias List = EnumLinkedList<Int>
    private let fixture = LinkedListFixture()

    /// Validates that `init(value:)` correctly captures the given `value`.
    func test_initValue() throws {
        let expectedValue = fixture.randomNumber
        let sut = EnumLinkedList(value: expectedValue)
        let head = try XCTUnwrap(sut.head)
        XCTAssertEqual(head.currentValue, expectedValue)
        XCTAssertNil(head.next)
    }
    
    /// Validates that `init(head:)` correctly captures the given `node`.
    func test_initNode() throws {
        let expectedValue = fixture.randomNumber
        let headNode = EnumListNode(expectedValue)
        let sut = EnumLinkedList(node: headNode)
        let head = try XCTUnwrap(sut.head)
        XCTAssertEqual(head.currentValue, expectedValue)
        XCTAssertNil(head.next)
    }
    
    /// Validates that `head` returns `nil` when there are no nodes in the
    /// list..
    func test_head_empty() throws {
        let sut = List.empty
        XCTAssertNil(sut.head)
    }
    
    /// Validates that `head` returns the expected value.
    func test_head() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = numbers[0]
        let headNode = fixture.makeNodeSUT(numbers: numbers)
        let sut = EnumLinkedList(node: headNode)
        XCTAssertEqual(sut.head?.currentValue, expectedValue)
    }
    
    /// Validates that `tail` returns `nil` when there are no nodes in the list.
    func test_tail_empty() throws {
        let sut = List.empty
        XCTAssertNil(sut.tail)
    }
    
    /// Validates that `tail` returns the expected value.
    func test_tail() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count - 1
        let expectedValue = numbers[index]
        let headNode = fixture.makeNodeSUT(numbers: numbers)
        let sut = EnumLinkedList(node: headNode)
        XCTAssertEqual(sut.tail?.currentValue, expectedValue)
    }
    
    /// Validates that `count` returns `0` when there are no nodes in the list.
    func test_count_empty() throws {
        let sut = List.empty
        XCTAssertEqual(sut.count, 0)
    }
    
    /// Validates that `count` returns the expected value.
    func test_count() throws {
        let numbers = fixture.randomNumbers()
        let headNode = fixture.makeNodeSUT(numbers: numbers)
        let sut = EnumLinkedList(node: headNode)
        XCTAssertEqual(sut.count, numbers.count)
    }
    
    /// Validates that `count` returns `0` when there are no nodes in the list.
    func test_isEmpty_true() throws {
        let sut = List.empty
        XCTAssertTrue(sut.isEmpty)
    }
    
    /// Validates that `isEmpty` returns the expected value.
    func test_isEmpty_false() throws {
        let sut = fixture.makeListSUT()
        XCTAssertFalse(sut.isEmpty)
    }
    
    /// Validates that `node(at:)` returns `nil` when the list has no nodes in
    /// it.
    func test_nodeAt_empty() throws {
        let sut = List.empty
        XCTAssertNil(try sut.node(at: 5))
    }
    
    /// Validates that `node(at:)` returns the expected value.
    func test_nodeAt() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        let expectedValue = numbers[index]
        let headNode = fixture.makeNodeSUT(numbers: numbers)
        let sut = EnumLinkedList(node: headNode)
        XCTAssertEqual(try sut.node(at: index)?.currentValue, expectedValue)
    }
    
    /// Validates that `insert(_:)` correctly inserts a value into an empty
    /// list.
    func test_insert_empty() throws {
        let expectedValue = fixture.randomNumber
        var sut = List.empty
        sut.insert(expectedValue)
        XCTAssertEqual(sut.head?.currentValue, expectedValue)
    }
    
    /// Validates that `insert(_:)` can insert a value into a list containing
    /// nodes.
    func test_insert() throws {
        let expectedValue = fixture.randomNumber
        var sut = fixture.makeListSUT()
        sut.insert(expectedValue)
        let tailNode = try XCTUnwrap(sut.tail)
        XCTAssertEqual(tailNode.currentValue, expectedValue)
    }
    
    /// Validates that `removeAll` removes the only item in the list.
    func test_removeAll_one_node_list() throws {
        let expectedValue = fixture.randomNumber
        let headNode = EnumListNode(expectedValue)
        
        var sut = EnumLinkedList(node: headNode)
        XCTAssertEqual(sut.head?.currentValue, expectedValue)
        
        sut.removeAll()
        XCTAssertNil(sut.head)
    }
    
    /// Validates that `insert(_:at:)` can insert a value into an empty list.
    func test_insertAt_empty() throws {
        let expectedValue = fixture.randomNumber
        var sut = List.empty
        try sut.insert(expectedValue, at: 999)
        XCTAssertEqual(sut.head?.currentValue, expectedValue)
    }
    
    /// Validates that `insert(_:at:)` can insert a value into the correct
    /// position in a list with nodes.
    func test_insertAt() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: index)
        
        var sut = fixture.makeListSUT(numbers: numbers)
        try sut.insert(expectedValue, at: index)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:after:)` correctly inserts a value into an empty list.
    func test_insertAfter_empty() throws {
        let expectedValue = fixture.randomNumber
        let someNode = EnumListNode(fixture.randomNumber)
        var sut = List.empty
        try sut.insert(expectedValue, after: someNode)
        XCTAssertEqual(sut.head?.currentValue, expectedValue)
    }
    
    /// Validates that `insert(_:after:)` can insert a value into the list after a given node.
    func test_insertAfter() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: index + 1)
        
        let headNode = fixture.makeNodeSUT(numbers: numbers)
        let afterNode = try headNode.node(at: index)
        
        var sut = fixture.makeListSUT(node: headNode)
        try sut.insert(expectedValue, after: afterNode)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:before:)` correctly inserts a value into an empty list.
    func test_insertBefore_empty() throws {
        let expectedValue = fixture.randomNumber
        let someNode = EnumListNode(fixture.randomNumber)
        var sut = List.empty
        try sut.insert(expectedValue, before: someNode)
        XCTAssertEqual(sut.head?.currentValue, expectedValue)
    }
    
    /// Validates that `insert(_:before:)` can insert a value into the list before a given node.
    func test_insertBefore() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: index - 1)
        
        let headNode = fixture.makeNodeSUT(numbers: numbers)
        let beforeNode = try headNode.node(at: index)
        
        var sut = fixture.makeListSUT(node: headNode)
        try sut.insert(expectedValue, before: beforeNode)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
    }
    
    /// Validates that `remove(at:)` does nothing when operating on an empty list..
    func test_removeAt_empty() throws {
        var sut = List.empty
        try sut.remove(at: 999)
    }
    
    /// Validates that `remove(at:)` can remove a node at the given index.
    func test_removeAt() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        var sut = fixture.makeListSUT(numbers: numbers)
        try sut.remove(at: index)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
    }
    
    /// Validates that `removeFirst()` does nothing when operating on an empty list.
    func test_removeFirst_empty() throws {
        var sut = List.empty
        sut.removeFirst()
    }
    
    /// Validates that `removeFirst()` the list is empty after removing the first node
    /// in a one node list.
    func test_removeFirst_one_node() throws {
        let headNode = fixture.makeNodeSUT(nodeCount: 1)
        var sut = fixture.makeListSUT(node: headNode)
        sut.removeFirst()
        XCTAssertNil(sut.head)
    }
    
    /// Validates that `removeFirst()` can remove a node at the given index.
    func test_removeFirst() throws {
        let numbers = fixture.randomNumbers()
        var expectedArray = numbers
        expectedArray.remove(at: 0)
        
        var sut = fixture.makeListSUT(numbers: numbers)
        sut.removeFirst()
        XCTAssertEqual(sut.head?.asArray, expectedArray)
    }
    
    /// Validates that `removeLast()` does nothing when operating on an empty list.
    func test_removeLast_empty() throws {
        var sut = List.empty
        try sut.removeLast()
    }
    
    /// Validates that `removeLast()` the list is empty after removing the last node
    /// in a one node list.
    func test_removeLast_one_node() throws {
        let headNode = fixture.makeNodeSUT(nodeCount: 1)
        var sut = fixture.makeListSUT(node: headNode)
        try sut.removeLast()
        XCTAssertNil(sut.head)
    }
    
    /// Validates that `removeLast()` can remove a node at the given index.
    func test_removeLast() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count - 1
        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        var sut = fixture.makeListSUT(numbers: numbers)
        try sut.removeLast()
        XCTAssertEqual(sut.head?.asArray, expectedArray)
    }
    
    /// Validates that `remove(node:)` does nothing when operating on an empty list.
    func test_removeNode_empty() throws {
        let bogusNode = fixture.makeBogusNode()
        var sut = List.empty
        try sut.remove(node: bogusNode)
    }
    
    /// Validates that `remove(node:)` the list is empty after removing the last node
    /// in a one node list.
    func test_removeNode_one_node() throws {
        let headNode = fixture.makeNodeSUT(nodeCount: 1)
        var sut = fixture.makeListSUT(node: headNode)
        try sut.remove(node: headNode)
        XCTAssertNil(sut.head)
    }
    
    /// Validates that `remove(node:)` can remove a node at the given index.
    func test_removeNode() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        var sut = fixture.makeListSUT(numbers: numbers)
        let targetNode = try XCTUnwrap(try sut.node(at: index))
        try sut.remove(node: targetNode)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
    }
    
    /// Validates that `removeAll` removes all of the nodes in a list.
    func test_removeAll() throws {
        var sut = fixture.makeListSUT()
        sut.removeAll()
        XCTAssertNil(sut.head)
    }
}

extension LinkedListFixture {
    func makeListSUT(nodeCount: Int = Default.nodeCount) -> EnumLinkedList<Int> {
        let headNode = makeNodeSUT(nodeCount: nodeCount)
        return EnumLinkedList(node: headNode)
    }
    
    func makeListSUT(numbers: [Int]) -> EnumLinkedList<Int> {
        let headNode = makeNodeSUT(numbers: numbers)
        return EnumLinkedList(node: headNode)
    }
    
    func makeListSUT(node: EnumListNode<Int>) -> EnumLinkedList<Int> {
        EnumLinkedList(node: node)
    }
}
