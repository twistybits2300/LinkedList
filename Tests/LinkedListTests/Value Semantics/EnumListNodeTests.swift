import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode`.
final class EnumListNodeTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `ListNode(_value:)` sets `next` to `nil`.
    func test_init_sets_next_nil() throws {
        let expectedValue = fixture.randomNumber
        let sut = EnumListNode(expectedValue)
        
        XCTAssertEqual(sut.currentValue, expectedValue)
        XCTAssertNil(sut.next)
    }
    
    /// Validates that `init(_ value:next:)` correctly captures the provided parameters.
    func test_init_value_next() throws {
        let nextValue = fixture.randomNumber
        let nextNode = EnumListNode(nextValue)
        XCTAssertEqual(nextNode.currentValue, nextValue)
        XCTAssertNil(nextNode.next)
        
        let expectedValue = fixture.randomNumber
        let sut = EnumListNode(expectedValue, next: nextNode)
        
        XCTAssertEqual(sut.currentValue, expectedValue)
        XCTAssertEqual(sut.next?.currentValue, nextValue)
    }
    
    /// Validates that `insert(_ value:)` into an empty list works as  expected.
    func test_insert_empty_list_success() throws {
        let expectedValue = fixture.randomNumber
        var sut = EnumListNode(expectedValue)

        XCTAssertEqual(sut.currentValue, expectedValue)
        XCTAssertNil(sut.next)
        
        let expectedNextValue = fixture.randomNumber
        sut.insert(expectedNextValue)
        
        let nextNode = try XCTUnwrap(sut.next)
        XCTAssertEqual(nextNode.currentValue, expectedNextValue)
        XCTAssertNil(nextNode.next)
    }
    
    /// Validates that `insert(_ value:)` into a non-empty list works as  expected.
    func test_insert_success() throws {
        let firstNumber = fixture.randomNumber
        let secondNumber = fixture.randomNumber
        let thirdNumber = fixture.randomNumber
        
        var sut = EnumListNode(firstNumber)
        XCTAssertEqual(sut.currentValue, firstNumber)
        XCTAssertNil(sut.next)
        
        sut.insert(secondNumber)
        XCTAssertEqual(sut.next?.currentValue, secondNumber)
        XCTAssertNotNil(sut.next)
        XCTAssertNil(sut.next?.next)
        
        sut.insert(thirdNumber)
        XCTAssertEqual(sut.next?.next?.currentValue, thirdNumber)
        XCTAssertNotNil(sut.next?.next)
        XCTAssertNil(sut.next?.next?.next)
    }
    
    /// Validates that `insert(_:at:)` correctly handles inserting at the head of the list.
    func test_insert_at_head() throws {
        var sut = fixture.makeSUT()
        let expectedValue = sut.currentValue
        
        let randomNumber = fixture.randomNumber
        try sut.insert(randomNumber, at: 0)
        XCTAssertEqual(sut.currentValue, randomNumber)
        XCTAssertEqual(sut.next?.currentValue, expectedValue)
    }
    
    /// Validates that `insert(_:at:)` works as expected when inserting recursively at a point
    /// that's not the head of the list and for which there is a `next` node.
    func test_insert_at_recursive() throws {
        var sut = fixture.makeSUT()
        let index = 2
        XCTAssertLessThan(index, Default.nodeCount)
        
        let randomNumber = fixture.randomNumber
        try sut.insert(randomNumber, at: index)
        
        var currentNode = sut
        for i in 0..<index + 1 {
            if i == index {
                XCTAssertEqual(currentNode.currentValue, randomNumber)
            }
            currentNode = try XCTUnwrap(currentNode.next)
        }
    }
    
    /// Validates that `insert(_:at:)` throws an error when given an invalid `index`.
    func test_insert_throws() throws {
        var sut = fixture.makeSUT()
        let index = Default.nodeCount + 1
        XCTAssertGreaterThan(index, Default.nodeCount)
        
        let randomNumber = fixture.randomNumber
        XCTAssertThrowsError(try sut.insert(randomNumber, at: index))
    }
    
    /// Validates that `insert(_:after)` works as expected when the `afterNode` is
    /// the node under test..
    func test_insertAfter_node_equals_afterNode() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = fixture.randomNumber
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: 1)
        
        var sut = fixture.makeSUT(numbers: numbers)
        try sut.insert(expectedValue, after: sut)
        
        let resultArray = sut.asArray
        XCTAssertEqual(resultArray, expectedArray)
    }
    
    /// Validates that `insert(_:after:)` correctly handles inserting after a node
    /// that's not the node under test.
    func test_insertAfter_recursive() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = fixture.randomNumber
        var expectedArray = numbers
        let index = numbers.count / 2
        expectedArray.insert(expectedValue, at: index + 1)
        
        var sut = fixture.makeSUT(numbers: numbers)
        XCTAssertEqual(sut.asArray, numbers)
        
        let afterNode = try XCTUnwrap(sut.node(at: index))
        try sut.insert(expectedValue, after: afterNode)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:after:)` throws an error when given an invalid `index`.
    func test_insertAfter_throws() throws {
        let bogusNode = EnumListNode(fixture.bogusNumber)
        var sut = fixture.makeSUT()
        
        let randomNumber = fixture.randomNumber
        XCTAssertThrowsError(try sut.insert(randomNumber, after: bogusNode))
    }
    
    /// Validates that `insert(_:before)` works as expected when the `beforeNode` is
    /// the node under test..
    func test_insertBefore_node_equals_beforeNode() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = fixture.randomNumber
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: 0)
        
        var sut = fixture.makeSUT(numbers: numbers)
        let beforeNode = try XCTUnwrap(sut.node(at: 1))
        try sut.insert(expectedValue, before: beforeNode)
        
        let resultArray = sut.asArray
        XCTAssertEqual(resultArray, expectedArray)
    }
    
    /// Validates that `insert(_:before:)` correctly handles inserting before a node
    /// that's not the node under test.
    func test_insertBefore_recursive() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = fixture.randomNumber
        var expectedArray = numbers
        let index = numbers.count / 2
        expectedArray.insert(expectedValue, at: index - 1)
        
        var sut = fixture.makeSUT(numbers: numbers)
        XCTAssertEqual(sut.asArray, numbers)
        
        let beforeNode = try XCTUnwrap(sut.node(at: index))
        try sut.insert(expectedValue, before: beforeNode)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:before:)` throws an error when given an invalid `index`.
    func test_insertBefore_throws() throws {
        let bogusNode = EnumListNode(fixture.bogusNumber)
        var sut = fixture.makeSUT()
        
        let randomNumber = fixture.randomNumber
        XCTAssertThrowsError(try sut.insert(randomNumber, before: bogusNode))
    }
    
    /// Validates that `traverse(visit:)` visits each node in the list.
    func test_traverse() throws {
        let expectedArray = fixture.randomNumbers()
        var receivedNumbers = [Int]()
        
        func visitor(node: EnumListNode<Int>) {
            receivedNumbers.append(node.currentValue)
        }
        
        let sut = fixture.makeSUT(numbers: expectedArray)
        sut.traverse(visit: visitor)
        
        XCTAssertEqual(receivedNumbers, expectedArray)
    }

    // MARK: - Utilities
    private func debug(_ sut: EnumListNode<Int>) {
        var currentNode: EnumListNode? = sut
        while currentNode?.next != nil {
            if let node = currentNode {
                print("  \(node.currentValue)")
            }
            currentNode = currentNode?.next
        }
    }
}

private struct Default {
    static var nodeCount = 5
}

private extension LinkedListFixture {
    func makeSUT(nodeCount: Int = Default.nodeCount) -> EnumListNode<Int> {
        makeSUT(numbers: self.randomNumbers(count: nodeCount))
    }
    
    func makeSUT(numbers: [Int]) -> EnumListNode<Int> {
        var sut = EnumListNode(numbers[0])
        
        for number in numbers.dropFirst() {
            sut.insert(number)
        }
        
        return sut
    }
}

private extension EnumListNode {
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
    
    func node(at index: Int) -> EnumListNode<T>? {
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
}
