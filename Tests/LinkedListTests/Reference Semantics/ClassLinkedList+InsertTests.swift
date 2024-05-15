import XCTest
import os
@testable import LinkedList

/// Validation of `ClassLinkedList+Insert`.
final class ClassLinkedList_InsertTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `append(:)` works when appending into an empty list.
    func test_append_empty() throws {
        let expectedValue = fixture.randomNumber
        let sut = fixture.makeEmptyListSUT()
        sut.append(expectedValue)
        XCTAssertEqual(sut.head?.value, expectedValue)
    }
    
    /// Validates that `append(_:)` correctly appends into a list with one node.
    func test_append() throws {
        let randomNumber = fixture.randomNumber
        let sut = fixture.makeListSUT(randomNumber)
        let expectedValue = fixture.randomNumber
        let expectedArray = [randomNumber, expectedValue]
        sut.append(expectedValue)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `append(_:)` can correctly append at the end of a list with multiple nodes.
    func test_append_multiple_nodes() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        var expectedArray = numbers
        expectedArray.append(expectedValue)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        sut.append(expectedValue)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
}
