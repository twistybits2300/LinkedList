import XCTest
import os
@testable import LinkedList

/// Validation of `ListNode`.
final class ListNodeTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `init(value:)` correctly captures the given `value`.
    func test_init_captures_value() throws {
        let expectedValue = fixture.randomNumber
        let sut = ListNode(expectedValue)
        XCTAssertEqual(sut.value, expectedValue)
        XCTAssertNil(sut.next)
    }
    
    /// Validates that `init(value:next:)` captures the given `next` node.
    func test_init_captures_next() throws {
        let nextNodeValue = fixture.randomNumber
        let nextNode = ListNode(nextNodeValue)
        
        let expectedValue = fixture.randomNumber
        let sut = ListNode(expectedValue, next: nextNode)
        XCTAssertEqual(sut.value, expectedValue)
        XCTAssertEqual(sut.next?.value, nextNodeValue)
    }
}

extension LinkedListFixture {
    func makeListNodeSUT(value: Int) -> ListNode<Int> {
        ListNode(value)
    }
}
