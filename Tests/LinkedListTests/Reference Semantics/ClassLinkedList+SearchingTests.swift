import XCTest
import os
@testable import LinkedList

/// Validation of `ClassLinkedList+Searching`.
final class ClassLinkedList_SearchingTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `find(_:)` returns `nil` when the list is empty.
    func test_find_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        XCTAssertNil(sut.find(fixture.randomNumber))
    }
    
    /// Validates that `find(_:)` returns `nil` when the value isn't contained in the list.
    func test_find_value_not_in_list() throws {
        let numbers = fixture.randomNumbers()
        let bogusNumber = fixture.bogusNumber
        let sut = fixture.makeListSUT(numbers: numbers)
        XCTAssertNil(sut.find(bogusNumber))
    }
    
    /// Validates that `find(_:)` returns the expected node.
    func test_find() throws {
        /* ensure the numbers are unique */
        let numbers = Array(Set<Int>(fixture.randomNumbers()))
        let index = numbers.count - 1
        let expectedValue = numbers[index]
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedNode = try XCTUnwrap(sut.find(_: expectedValue))
        XCTAssertEqual(returnedNode.value, expectedValue)
    }
}
