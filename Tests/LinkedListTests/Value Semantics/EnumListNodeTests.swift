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
    
    /// Validates that `init(_ value:next:)` correctly captures the provided parameters.
    func test_init_value_next() throws {
        let nextValue = fixture.randomNumber
        let nextNode = EnumListNode(nextValue)
        XCTAssertEqual(nextNode.currentValue, nextValue)
        XCTAssertNil(nextNode.next)
        
        let expectedValue = fixture.randomNumber
        let sut = EnumListNode(expectedValue, next: nextNode)
        
        XCTAssertEqual(sut.currentValue, expectedValue)
        XCTAssertEqual(sut.next?.currentValue, nextValue)
    }
}

struct Default {
    static var nodeCount = 5
}

extension LinkedListFixture {
    func makeEnumNodeSUT(nodeCount: Int = Default.nodeCount) -> EnumListNode<Int> {
        makeEnumNodeSUT(numbers: self.randomNumbers(count: nodeCount))
    }
    
    func makeEnumNodeSUT(numbers: [Int]) -> EnumListNode<Int> {
        var sut = EnumListNode(numbers[0])
        
        for number in numbers.dropFirst() {
            sut.insert(number)
        }
        
        return sut
    }
    
    func makeEnumBogusNode() -> EnumListNode<Int> {
        EnumListNode(bogusNumber)
    }
}
