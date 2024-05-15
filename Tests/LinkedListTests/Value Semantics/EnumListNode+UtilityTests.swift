import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode+Utility`.
final class EnumListNode_UtilityTests: XCTestCase {
    private let fixture = LinkedListFixture()
    
    /// Validates that `count` returns the expected value when there are multiple
    /// nodes in the list..
    func test_count_multiple_nodes() throws {
        let numbers = fixture.randomNumbers()
        let expectedCount = numbers.count
        let sut = fixture.makeNodeSUT(numbers: numbers)
        XCTAssertEqual(sut.count, expectedCount)
    }
    
    /// Validates that `count` returns the expected value when there's only a
    /// single node in the list.
    func test_count_one_node() throws {
        let expectedValue = fixture.randomNumber
        let sut = EnumListNode(expectedValue)
        XCTAssertEqual(sut.count, 1)
    }
}
