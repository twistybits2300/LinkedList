import XCTest
import os
@testable import LinkedList

/// Validation of `ListNode+Insertion`.
final class ListNode_InsertionTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `append(_:)` correctly appends into a list with one node.
    func test_append() throws {
        let sut = ListNode(fixture.randomNumber)
        let expectedValue = fixture.randomNumber
        sut.append(expectedValue)
        XCTAssertEqual(sut.next?.value, expectedValue)
    }
    
    /// Validates that `append(_:)` can correctly append at the end of a list with multiple nodes.
    func test_append_multiple_nodes() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        var expectedArray = numbers
        expectedArray.append(expectedValue)
        
        let sut = fixture.makeListNodeSUT(numbers: numbers)
        sut.append(expectedValue)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
}
