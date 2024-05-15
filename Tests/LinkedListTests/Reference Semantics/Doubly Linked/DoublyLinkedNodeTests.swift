import XCTest
import os
@testable import LinkedList

/// Validation of `DoublyLinkedNode`.
final class DoublyLinkedNodeTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `init(value:)` correctly captures the provided `value`.
    func test_initValue() throws {
        let expectedValue = fixture.exampleValue
        let sut = fixture.makeSUT()
        XCTAssertEqual(sut.value, expectedValue)
    }

    /// Validates that `init(value:next:)` correctly sets the `value` and
    /// `next` node when the `previous` parameter is left to its default of `nil`.
    func test_initValueNext_default_values() throws {
        let expectedNodeValue = fixture.exampleValue
        let expectedNextValue = fixture.nextValue

        let nextNode = fixture.makeSUT(value: expectedNextValue)
        XCTAssertEqual(nextNode.value, expectedNextValue)

        let sut = DoublyLinkedNode(value: expectedNodeValue, next: nextNode)
        XCTAssertEqual(sut.value, expectedNodeValue)
        XCTAssertEqual(sut.next?.value, expectedNextValue)
        XCTAssertNil(sut.previous)
    }

    /// Validates that `init(value:previous:)` correctly captures `value` and
    /// `previous` node when the `next` is left to its default of `nil`.
    func test_initValuePrevious_default_values() throws {
        let expectedNodeValue = fixture.exampleValue
        let expectedPreviousValue = fixture.previousValue

        let previousNode = fixture.makeSUT(value: expectedPreviousValue)
        XCTAssertEqual(previousNode.value, expectedPreviousValue)

        let sut = DoublyLinkedNode(value: expectedNodeValue, previous: previousNode)
        XCTAssertEqual(sut.value, expectedNodeValue)
        XCTAssertEqual(sut.previous?.value, expectedPreviousValue)
        XCTAssertNil(sut.next)
    }

    /// Validates that `init(value:next:previous:)` correctly captures the given parameters.
    func test_initValueNextPrevious() throws {
        let expectedNodeValue = fixture.exampleValue
        let expectedNextValue = fixture.nextValue
        let expectedPreviousValue = fixture.previousValue

        let nextNode = fixture.makeSUT(value: expectedNextValue)
        XCTAssertEqual(nextNode.value, expectedNextValue)

        let previousNode = fixture.makeSUT(value: expectedPreviousValue)
        XCTAssertEqual(previousNode.value, expectedPreviousValue)

        let sut = DoublyLinkedNode(value: expectedNodeValue,
                                   next: nextNode,
                                   previous: previousNode)
        XCTAssertEqual(sut.value, expectedNodeValue)
        XCTAssertEqual(sut.next?.value, expectedNextValue)
        XCTAssertEqual(sut.previous?.value, expectedPreviousValue)
    }
}

private extension LinkedListFixture {
    var exampleValue: String { "this is some text" }
    var nextValue: String { "the NEXT" }
    var previousValue: String { "the PREVIOUS" }

    var nilNode: DoublyLinkedNode<String>? { nil }

    func makeSUT() -> DoublyLinkedNode<String> {
        DoublyLinkedNode(value: exampleValue)
    }

    func makeSUT(value: String) -> DoublyLinkedNode<String> {
        DoublyLinkedNode(value: value)
    }

    func makeExampleSUT() -> DoublyLinkedNode<String> {
        makeSUT(value: exampleValue)
    }
}
