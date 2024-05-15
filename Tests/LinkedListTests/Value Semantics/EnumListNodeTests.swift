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
                let result = currentNode.currentValue == randomNumber
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
        let numbers = self.randomNumbers(count: nodeCount)
        var sut = EnumListNode(numbers[0])
        
        for number in numbers.dropFirst() {
            sut.insert(number)
        }
        
        return sut
    }
}
