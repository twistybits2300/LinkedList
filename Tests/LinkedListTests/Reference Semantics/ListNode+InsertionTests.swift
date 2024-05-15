import XCTest
import os
@testable import LinkedList

/// Validation of `ListNode+Insertion`.
final class ListNode_InsertionTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `insert(_:)` correctly inserts into a list with one node.
    func test_insert() throws {
        let sut = ListNode(value: fixture.randomNumber)
        let expectedValue = fixture.randomNumber
        sut.insert(expectedValue)
        XCTAssertEqual(sut.next?.value, expectedValue)
    }
    
    /// Validates that `insert(_:)` can correctly insert at the end of a list with multiple nodes.
    func test_insert_multiple_nodes() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        var expectedArray = numbers
        expectedArray.append(expectedValue)
        
        let sut = fixture.makeListNodeSUT(numbers: numbers)
        sut.insert(expectedValue)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
}
