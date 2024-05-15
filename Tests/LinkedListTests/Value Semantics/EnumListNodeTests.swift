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
}
