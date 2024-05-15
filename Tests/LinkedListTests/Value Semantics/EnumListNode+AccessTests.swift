import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode+AccessTests`.
final class EnumListNode_AccessTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `first` returns the first node in the list.
    func test_first() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = numbers[0]
        let sut = fixture.makeNodeSUT(numbers: numbers)
        let firstNumber = try XCTUnwrap(sut.first?.currentValue)
        XCTAssertEqual(firstNumber, expectedValue)
    }
    
    /// Validates that `last` returns the last node in the list.
    func test_last()  throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count - 1
        let expectedValue = numbers[index]
        let sut = fixture.makeNodeSUT(numbers: numbers)
        let lastNumber = try XCTUnwrap(sut.last?.currentValue)
        XCTAssertEqual(lastNumber, expectedValue)
    }
    
    /// Validates that `node(at:)` returns the expected value.
    func test_nodeAt_success() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        let expectedValue = numbers[index]
        let sut = fixture.makeNodeSUT(numbers: numbers)
        let returnedNode = try sut.node(at: index)
        XCTAssertEqual(returnedNode.currentValue, expectedValue)
    }
    
    /// Validates that `node(at:)` throws an error when given an invalid `index`.
    func test_nodeAt_failure() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count + 1
        let sut = fixture.makeNodeSUT(numbers: numbers)
        XCTAssertThrowsError(try sut.node(at: index))
    }
    
}
