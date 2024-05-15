import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode+Deletion`.
final class EnumListNode_DeletionTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `remove(at:)` can successfully remove the head of the list.
    func test_removeAt_head() throws {
        let numbers = fixture.randomNumbers()
        let expectedArray = Array(numbers.dropFirst())
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        try sut.remove(at: 0)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `remove(at:)` can successfully remove the tail of the list.
    func test_removeAt_tail() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count - 1
        let expectedArray = Array(numbers.dropLast())
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        try sut.remove(at: index)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `remove(at:)` can successfully remove the middle of the list.
    func test_removeAt_middle() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.remove(at: index)
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        try sut.remove(at: index)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `remove(at:)` throws an error when given an invalid `index`.
    func test_removeAt_failure_too_bit() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count + 1
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        XCTAssertThrowsError(try sut.remove(at: index))
    }
    
    /// Validates that `remove(at:)` throws an error when given an invalid `index`.
    func test_removeAt_failure_less_than_zero() throws {
        let index = -1
        var sut = fixture.makeEnumNodeSUT()
        XCTAssertThrowsError(try sut.remove(at: index))
    }
    
    /// Validates that `remove(node:)` correctly removes the head node.
    func test_removeNode_head() throws {
        let numbers = fixture.randomNumbers()
        let expectedArray = Array(numbers.dropFirst())
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        try sut.remove(node: sut)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `remove(node:)` throws an error when trying to remove the
    /// head node in a list with only one node.
    func test_removeNode_head_failure() throws {
        var sut = fixture.makeEnumNodeSUT(nodeCount: 1)
        XCTAssertThrowsError(try sut.remove(node: sut))
    }
    
    /// Validates that `remove(node:)` can successfuly remove the tail of the list.
    func test_removeNode_tail()  throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count - 1
        let expectedArray = Array(numbers.dropLast())
        
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        let tail = try XCTUnwrap(sut.node(at: index))
        try sut.remove(node: tail)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `remove(node:)` can successfuly remove the middle of the list.
    func test_removeNode_middle()  throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        let tail = try XCTUnwrap(sut.node(at: index))
        try sut.remove(node: tail)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `remove(node:)` throws an error when given a node
    /// that is not in the list
    func test_removeNode_failure() throws {
        var sut = fixture.makeEnumNodeSUT()
        let bogusNode = fixture.makeEnumBogusNode()
        XCTAssertThrowsError(try sut.remove(node: bogusNode))
    }
    
    /// Validates that `removeLast()` throws an error when trying to remove the
    /// head node in a list with only one node.
    func test_removeLast_head_failure() throws {
        var sut = fixture.makeEnumNodeSUT(nodeCount: 1)
        XCTAssertThrowsError(try sut.removeLast())
    }
    
    /// Validates that `remove(last:)` works as expected.
    func test_removeLast_success() throws {
        let numbers = fixture.randomNumbers()
        let expectedArray = Array(numbers.dropLast())
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        try sut.removeLast()
        XCTAssertEqual(sut.asArray, expectedArray)
    }
}
