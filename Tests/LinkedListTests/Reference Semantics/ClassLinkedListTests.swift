import XCTest
import os
@testable import LinkedList

/// Validation of `ClassLinkedList`.
final class ClassLinkedListTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `init()` sets `head` to `nil`.
    func test_init() throws {
        let sut = ClassLinkedList<Int>()
        XCTAssertNil(sut.head)
    }
    
    /// Validates that `init(head:)` correctly captures the given node as the `head`.
    func test_initHead() throws {
        let expectedValue = fixture.randomNumber
        let node = fixture.makeListNodeSUT(value: expectedValue)
        let sut = ClassLinkedList(head: node)
        XCTAssertEqual(sut.head?.value, expectedValue)
    }
}

extension LinkedListFixture {
    func makeEmptyListSUT() -> ClassLinkedList<Int> {
        ClassLinkedList()
    }
    
    func makeListSUT(_ value: Int) -> ClassLinkedList<Int> {
        let node = makeListNodeSUT(value: value)
        return ClassLinkedList(head: node)
    }
    
    func makeListSUT(numbers: [Int]) -> ClassLinkedList<Int> {
        let sut = makeEmptyListSUT()
        for number in numbers {
            sut.append(number)
        }
        return sut
    }
}
